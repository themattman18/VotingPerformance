using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ReviewableVoting.IO.Models
{
    class Vote
    {

        [Display(Name = "VoteID")]
        public int VoteID { get; set; }
        [Display(Name = "TimeStamp")]
        public string TimeStamp { get; set; }
        [Display(Name = "CandidateID")]
        public int CandidateID { get; set; }
        [Display(Name = "voterID")]
        public int voterID { get; set; }
        [Display(Name = "CheckSum")]
        public int CheckSum { get; set; }
        [Display(Name = "CumulativeCheckSum")]
        public int CumulativeCheckSum { get; set; }
    }
}
