using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ReviewableVoting.IO.Report
{
    public static class Report
    {
        /// <summary>
        /// Gets a list of the elections that are closed
        /// </summary>
        /// <returns></returns>
        public static List<Models.ElectionsModel> GetClosedElections()
        {
            List<Models.ElectionsModel> electionData;

            using (var myContext = new Entity.reviewablevotingEntities())
            {
                electionData = (from x in myContext.Elections
                                join y in myContext.ElectionLevels on x.ElectionLevelID equals y.ElectionLevelID
                                  where x.EndDate < DateTime.Now
                                  select new Models.ElectionsModel()
                                  {
                                      ElectionID = x.ElectionID,
                                      ElectionName = x.BeginDate + " - " + x.EndDate + " " + y.ElectionLevel1
                                  }).ToList();
            }

            return electionData;
        }

        /// <summary>
        /// Get election results
        /// </summary>
        /// <param name="electionID"></param>
        public static List<Models.ElectionResults> GetElectionResults(int electionID)
        {
            List<Models.ElectionResults> myElectionResults = new List<Models.ElectionResults>();
            DataSet returnedElectionResults = new DataSet();

            // Cast the vote!
            using (SqlConnection myConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString))
            {
                using (SqlCommand myCommand = new SqlCommand("GetElectionResults", myConnection))
                {
                    myCommand.CommandType = System.Data.CommandType.StoredProcedure;
                    myCommand.Parameters.Add(new SqlParameter("@electionID", electionID));
                    using (SqlDataAdapter myDataAdapter = new SqlDataAdapter(myCommand))
                    {
                        myDataAdapter.Fill(returnedElectionResults);
                    }

                    foreach (DataRow currentRow in returnedElectionResults.Tables[0].Rows)
                    {
                        myElectionResults.Add(new Models.ElectionResults()
                        {
                            CandidateVoteCheckSum = currentRow["CheckSum"].ToString(),
                            ElectionCheckSum = currentRow["CumulativeCheckSum"].ToString(),
                            FirstName = currentRow["FirstName"].ToString(),
                            LastName = currentRow["LastName"].ToString(),
                            Party = currentRow["PartyName"].ToString(),
                            State = currentRow["State"].ToString(),
                            VoteID = int.Parse(currentRow["VoteID"].ToString())
                        });
                    }
                }
            }

            return myElectionResults;
        }

        /// <summary>
        /// Get the candidate results by state
        /// </summary>
        /// <param name="electionID"></param>
        public static List<Models.StateResults> GetStateResults(int electionID)
        {
            List<Models.StateResults> myStateResults = new List<Models.StateResults>();
            DataSet returnedStateResults = new DataSet();

            using (SqlConnection myConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString))
            {
                using (SqlCommand myCommand = new SqlCommand("GetStateResults", myConnection))
                {
                    myCommand.CommandType = System.Data.CommandType.StoredProcedure;
                    myCommand.Parameters.Add(new SqlParameter("@electionID", electionID));
                    using (SqlDataAdapter myDataAdapter = new SqlDataAdapter(myCommand))
                    {
                        myDataAdapter.Fill(returnedStateResults);
                    }

                    foreach (DataRow currentRow in returnedStateResults.Tables[0].Rows)
                    {
                        myStateResults.Add(new Models.StateResults()
                        {
                            CandidateID = int.Parse(currentRow["CandidateID"].ToString()),
                            CandidateName = currentRow["CandidateName"].ToString(),
                            PartyName = currentRow["PartyName"].ToString(),
                            State = currentRow["State"].ToString(),
                            VoteCount = int.Parse(currentRow["VoteCount"].ToString())
                        });
                    }
                }
            }

            return myStateResults;
        }
    }
}
