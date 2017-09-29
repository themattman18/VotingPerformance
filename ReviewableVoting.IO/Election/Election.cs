using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ReviewableVoting.IO.Election
{
    public static class Election
    {
        /// <summary>
        /// Gets a list of all the elections
        /// </summary>
        /// <returns></returns>
        public static List<Models.UserElectionData> GetElectionData(string userName)
        {
            List<Models.UserElectionData> electionData = new List<Models.UserElectionData>();
            DataSet sqlElectionData = new DataSet();

            // Gets all the the current elections and has a but that indicates if the user has voted in this election yet 
            string sqlQuery = @"SELECT e.ElectionID, e.BeginDate, e.EndDate, e.Office, e.ElectionLevelID, UserVotes.VoteID
                                FROM [reviewablevoting].[dbo].[Election] AS e
                                    LEFT JOIN(SELECT v.VoteID, c.ElectionID
                                              FROM Vote as v
                                                 INNER JOIN Candidates AS c  on c.CandidateID = v.CandidateID
                                                 INNER JOIN Voter      AS vo on vo.VoterID    = v.voterID
                                              WHERE vo.Email = @voterEmail) AS UserVotes on UserVotes.ElectionID = e.ElectionID
                                WHERE GETDATE() >= BeginDate AND GETDATE() <= EndDate";

            using (SqlConnection myConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString))
            {
                using (SqlCommand myCommand = new SqlCommand(sqlQuery, myConnection))
                {
                    myCommand.Parameters.Add(new SqlParameter("@voterEmail", userName));
                    using (SqlDataAdapter myDataAdapter = new SqlDataAdapter(myCommand))
                    {
                        myDataAdapter.Fill(sqlElectionData);
                    }
                }
            }

            // Build the results
            foreach (DataRow currentDataRow in sqlElectionData.Tables[0].Rows)
            {
                electionData.Add(new Models.UserElectionData()
                {
                    ElectionLevelID = (int)currentDataRow["ElectionLevelID"],
                    ElectionID = (int)currentDataRow["ElectionID"],
                    BeginDate = DateTime.Parse(currentDataRow["BeginDate"].ToString()),
                    EndDate = DateTime.Parse(currentDataRow["EndDate"].ToString()),
                    Office = currentDataRow["Office"].ToString(),
                    VoterEligible = string.IsNullOrEmpty(currentDataRow["VoteID"].ToString())
                });
            }

            return electionData;
        }

        /// <summary>
        /// Gets the list of candidates for the election
        /// </summary>
        /// <param name="electionID"></param>
        /// <returns></returns>
        public static List<Models.Candidates> GetCandidatesData(int electionID)
        {
            List<Models.Candidates> candidatesData;

            using (var myContext = new Entity.reviewablevotingEntities())
            {
                candidatesData = (from x in myContext.Candidates
                                  where x.ElectionID == electionID
                                select new Models.Candidates()
                                {
                                    CandidatesID = x.CandidateID,
                                    VoterID = (int)x.VoterID,
                                    FirstName = x.Voter.FirstName,
                                    LastName = x.Voter.LastName,
                                    Party = x.Party.PartyName,
                                    ElectionID = electionID
                                }).ToList();
            }

            return candidatesData;
        }

        public static object GetElectionData()
        {
            throw new NotImplementedException();
        }
    }
}
