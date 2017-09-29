using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Numerics;
using System.Text;
using System.Threading.Tasks;

namespace ReviewableVoting.IO.Election
{
    public static class Vote
    {
        /// <summary>
        /// Checks to see if a user has already voted in an election
        /// </summary>
        /// <param name="userEmail"></param>
        /// <param name="electionID"></param>
        /// <returns></returns>
        public static bool HasUserVoted(string userEmail, int electionID)
        {
            using (var myContext = new Entity.reviewablevotingEntities())
            {
                var numberOfVotes = (from x in myContext.Votes
                                     join y in myContext.Candidates on x.CandidateID equals y.CandidateID
                                     where y.ElectionID == electionID
                                     select x).ToList().Count;
                return numberOfVotes > 0;
            }
        }

        /// <summary>
        /// Inserts a temp vote and returns a guid so we can verify the user saw the confirmation screen
        /// We can get the election id from the candidate but it's not very efficent to select this when we already have this data
        /// </summary>
        /// <param name="electionID"></param>
        /// <param name="candidateID"></param>
        public static Models.UserVote InsertTempVote(string userEmail, int candidateID, int electionID)
        {
            Models.UserVote newUserVote = null;
            Guid myAuthToken = Guid.NewGuid();

            using (var myContext = new Entity.reviewablevotingEntities())
            {
                var numberOfVotes = (from x in myContext.Votes
                                     join y in myContext.Candidates on x.CandidateID equals y.CandidateID
                                     join z in myContext.Voters on y.VoterID equals z.VoterID
                                     where y.ElectionID == electionID && z.Email == userEmail
                                     select x).ToList().Count;
                if (numberOfVotes <= 0)
                {
                    myContext.UnconfirmedVotes.Add(new Entity.UnconfirmedVote()
                    {
                        AuthToken = myAuthToken,
                        CandidateID = candidateID,
                        TimeStamp = DateTime.Now,
                        VoteAddEnd = VerificationNumber.getRandomAddend().ToString(),
                        TimeToLive = 5 // Set the time to live to be 5 minutes
                    });
                    myContext.SaveChanges();

                    newUserVote = (from x in myContext.Candidates
                                   join y in myContext.Voters on x.VoterID equals y.VoterID
                                   where x.CandidateID == candidateID
                                   select new Models.UserVote()
                                   {
                                       CandidateFirstName = y.FirstName,
                                       CandidateLastName = y.LastName,
                                       AuthToken = myAuthToken
                                   }).First();
                }
            }

            return newUserVote;
        }

        /// <summary>
        /// Casts a vote for a candidate
        /// </summary>
        /// <param name="voteAuthToken"></param>
        public static Models.VoteReceipt CastVote(Guid voteAuthToken, string userName)
        {
            Models.VoteReceipt myVoteReceipt;
            Entity.UnconfirmedVote tempVote;
            BigInteger candidateVoteCheckSum;
            BigInteger electionCheckSum;
            DataSet returnedVoteReceipt = new DataSet(); 

            using (var myContext = new Entity.reviewablevotingEntities())
            {
                tempVote = (from x in myContext.UnconfirmedVotes
                            where x.AuthToken == voteAuthToken
                            select x).FirstOrDefault();

                // Check if we have a vote
                if (tempVote != null)
                {
                    // Make sure this token hasn't expired
                    if (tempVote.TimeStamp.AddMinutes(tempVote.TimeToLive) > DateTime.Now)
                    {
                        // Gets the checksums
                        string candidateChecksum = (from x in myContext.Candidates
                                                    where x.CandidateID == tempVote.CandidateID
                                                    select x.CandidateChecksum).FirstOrDefault().ToString();
                        string lastElectionChecksum = (from x in myContext.Elections
                                                       join y in myContext.Candidates on x.ElectionID equals y.ElectionID
                                                       join z in myContext.Votes on x.PreviousVoteID equals z.VoteID
                                                       where y.CandidateID == tempVote.CandidateID
                                                       select z.CumulativeCheckSum).FirstOrDefault();
                        if (string.IsNullOrEmpty(lastElectionChecksum))
                        {
                            lastElectionChecksum = "0";
                        }

                        if (string.IsNullOrEmpty(candidateChecksum))
                            throw new Exception("Candidate doesn't have a checksum");

                        // Calculate the new checksums
                        candidateVoteCheckSum = VerificationNumber.checkSumVote(BigInteger.Parse(tempVote.VoteAddEnd), BigInteger.Parse(candidateChecksum));
                        electionCheckSum = BigInteger.Parse(lastElectionChecksum) + candidateVoteCheckSum;

                        // Cast the vote!
                        using (SqlConnection myConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString))
                        {
                            using (SqlCommand myCommand = new SqlCommand("CastVote", myConnection))
                            {
                                myCommand.CommandType = System.Data.CommandType.StoredProcedure;
                                myCommand.Parameters.Add(new SqlParameter("@userName", userName));
                                myCommand.Parameters.Add(new SqlParameter("@voteAuthToken", voteAuthToken));
                                myCommand.Parameters.Add(new SqlParameter("@CandidateVoteCheckSum", candidateVoteCheckSum.ToString()));
                                myCommand.Parameters.Add(new SqlParameter("@ElectionCheckSum", electionCheckSum.ToString()));
                                using (SqlDataAdapter myDataAdapter = new SqlDataAdapter(myCommand))
                                {
                                    myDataAdapter.Fill(returnedVoteReceipt);
                                }

                                // Build the vote receipt
                                myVoteReceipt = new Models.VoteReceipt()
                                {
                                    CandidateFirstName = returnedVoteReceipt.Tables[0].Rows[0][0].ToString(),
                                    CandidateLastName = returnedVoteReceipt.Tables[0].Rows[0][1].ToString(),
                                    CandidateParty = returnedVoteReceipt.Tables[0].Rows[0][2].ToString(),
                                };
                            }
                        }
                    }
                    else
                    {
                        throw new Exception("Time limit for vote expired");
                    }
                }
                else
                {
                    throw new Exception("No vote authentication record found");
                }
            }

            return myVoteReceipt;
        }

        /// <summary>
        /// Updates the election with the last vote cast in the election
        /// We needs this to determin what the previous checksum is
        /// </summary>
        public static void UpdateElectionLastVote()
        {

        }
    }
}


