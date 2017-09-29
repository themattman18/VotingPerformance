using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ReviewableVoting.IO.Models
{
    class ElectionLevel
    {
        [Display(Name = "ElectionlevelID")]
        public int ElectionlevelID { get; set; }
        [Display(Name = "Electionlevel")]
        public int Electionlevel { get; set; }
        
    }
}
