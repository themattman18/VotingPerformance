using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ReviewableVoting.IO.Models
{
    public class Candidates
    {

        [Display(Name = "Candidates ID")]
        public int CandidatesID { get; set; }

        [Display(Name = "Voter ID")]
        public int VoterID { get; set; }

        [Display(Name = "Election ID")]
        public int ElectionID { get; set; }

        [Display(Name = "Party")]
        public string Party { get; set; }

        [Display(Name = "First Name")]
        public string FirstName { get; set; }

        [Display(Name = "Last Name")]
        public string LastName { get; set; }
    }
}
