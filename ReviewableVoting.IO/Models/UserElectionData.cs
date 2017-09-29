using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ReviewableVoting.IO.Models
{
    public class UserElectionData
    {
        [Display(Name = "Election ID")]
        public int ElectionID { get; set; }

        [Display(Name = "Begin Date")]
        public DateTime BeginDate { get; set; }

        [Display(Name = "End Date")]
        public DateTime EndDate { get; set; }

        [Display(Name = "Office")]
        public string Office { get; set; }

        [Display(Name = "Party")]
        public string Party { get; set; }

        [Display(Name = "ElectionLevelID")]
        public int ElectionLevelID { get; set; }

        /// <summary>
        /// Determines if a voter is allowed to vote in this election
        /// </summary>
        [Display(Name = "Voter Eligible")]
        public bool VoterEligible { get; set; }
    }
}
