using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ReviewableVoting.IO.Models
{
    class ZipCode
    {

        [Display(Name = "ZipCodeID")]
        public int ZipCodeID { get; set; }
        [Display(Name = "ZipCode")]
        public string Zip_Code { get; set; }
        [Display(Name = "City")]
        public int City { get; set; }
        [Display(Name = "State")]
        public int State { get; set; }


     
    
    
    
    
    
    
    



    }
}
