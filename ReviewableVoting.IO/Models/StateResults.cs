using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ReviewableVoting.IO.Models
{
    public class StateResults
    {
        [Display(Name = "Vote Count")]
        public int VoteCount { get; set; }

        [Display(Name = "Candidate ID")]
        public int CandidateID { get; set; }

        [Display(Name = "State")]
        public string State { get; set; }

        [Display(Name = "Candidate Name")]
        public string CandidateName { get; set; }

        [Display(Name = "Party Name")]
        public string PartyName { get; set; }
    }
}
