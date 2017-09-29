using ReviewableVoting.Models.ErrorViewModels;
using System;
using System.Globalization;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;

namespace ReviewableVoting.Controllers
{
    public class ElectionController : Controller
    {
        public ActionResult Index(int electionID)
        {
            var candidatesData = IO.Election.Election.GetCandidatesData(electionID);

            return View(candidatesData);
        }

        /// <summary>
        /// Temporarily casts a vote for a candidate in an election
        /// The user will need to confirm that they intented to cast this vote
        /// </summary>
        /// <param name="candidateID"></param>
        /// <param name="electionID"></param>
        /// <returns></returns>
        public ActionResult ConfirmVote(int electionID, int candidateID)
        {

            IO.Models.UserVote newUserVote = IO.Election.Vote.InsertTempVote(HttpContext.User.Identity.Name, candidateID, electionID);

            if (newUserVote != null)
            {
                return View(newUserVote);
            }
            else
            {
                return View("ElectionError", new ElectionError() { Title = "Voter Error", Error = "You have already voted in this election" });
            }
        }

        /// <summary>
        /// Casts a vote in an election after a user has confirmed that they want to cast this vote
        /// </summary>
        /// <param name="voteAuthToken"></param>
        /// <returns></returns>
        public ActionResult CastVote(Guid voteAuthToken)
        {
            IO.Models.VoteReceipt userVoteReceipt;
            if (voteAuthToken != Guid.Empty)
            {
                userVoteReceipt = IO.Election.Vote.CastVote(voteAuthToken, HttpContext.User.Identity.Name);
            }
            else
            {
                throw new ArgumentException("Bad vote auth token: " + voteAuthToken);
            }

            return View("VoteReceipt", userVoteReceipt);
        }
    }
}