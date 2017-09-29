using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ReviewableVoting.IO.Models
{
    class VoterAddress
    {
        [Display(Name = "VoterAddressID")]
        public int VoterAddressID { get; set; }
        [Display(Name = "StreetAddressID")]
        public string StreetAddressID { get; set; }
        
    }
}
