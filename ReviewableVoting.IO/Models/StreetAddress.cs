using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ReviewableVoting.IO.Models
{
    class StreetAddress
    {
        [Display(Name = "StreetAddressID")]
        public int StreetAddressID { get; set; }
        [Display(Name = "Address")]
        public int Address { get; set; }
        [Display(Name = "ElectionID")]
        public int ElectionID { get; set; }
        [Display(Name = "ZipCodeID")]
        public int ZipCodeID { get; set; }
    }
}
