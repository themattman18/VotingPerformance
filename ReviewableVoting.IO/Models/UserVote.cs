using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ReviewableVoting.IO.Models
{

    public class UserVote
    {
        /// <summary>
        /// Authentication token that enables a user to confirm a vote
        /// </summary>
        public Guid AuthToken { get; set; }

        /// <summary>
        /// First name of the candidate
        /// </summary>
        public string CandidateFirstName { get; set; }

        /// <summary>
        /// Last name of the candidate
        /// </summary>
        public string CandidateLastName { get; set; }
    }
}
