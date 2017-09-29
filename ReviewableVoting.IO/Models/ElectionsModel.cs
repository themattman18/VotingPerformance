using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ReviewableVoting.IO.Models
{
    public class ElectionsModel
    {
        [Display(Name = "Election ID")]
        public int ElectionID { get; set; }

        [Display(Name = "Election")]
        public string ElectionName { get; set; }

    }
}
