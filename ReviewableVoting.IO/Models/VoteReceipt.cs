using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ReviewableVoting.IO.Models
{
    public class VoteReceipt
    {
        public string CandidateFirstName { get; set; }
        public string CandidateLastName { get; set; }
        public string CandidateParty { get; set; }
    }
}
