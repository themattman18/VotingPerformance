using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ReviewableVoting.IO.Models
{
    public class ElectionResults
    {
        [Display(Name = "Vote ID")]
        public int VoteID { get; set; }

        [Display(Name = "State")]
        public string State { get; set; }

        [Display(Name = "First Name")]
        public string FirstName { get; set; }

        [Display(Name = "Last Name")]
        public string LastName { get; set; }

        [Display(Name = "Candidate Name")]
        public string FullName { get { return FirstName + " " + LastName; } }

        [Display(Name = "Party")]
        public string Party { get; set; }

        [Display(Name = "Vote Checksum")]
        public string CandidateVoteCheckSum { get; set; }

        [Display(Name = "Election Checksum")]
        public string ElectionCheckSum { get; set; }

    }
}
