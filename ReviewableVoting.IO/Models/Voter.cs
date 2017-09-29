using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ReviewableVoting.IO.Models
{
    public class Voter
    {
        public Guid AspNetUsersID { get; set; }

        public string Email { get; set; }

        public string FirstName { get; set; }

        public string LastName { get; set; }

        public string Phone { get; set; }

        public string SSN { get; set; }

        //public string Photo { get; set; }

        public DateTime DateOfBirth { get; set; }


        public string Birthplace { get; set; }


        public string Address { get; set; }

        public string City { get; set; }

        public string State { get; set; }

        public int ZipCode { get; set; }


    }
}
