using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace ReviewableVoting.Models.AccountViewModels
{
    public class RegisterViewModel
    {
        [Required]
        [EmailAddress]
        [Display(Name = "Email")]
        public string Email { get; set; }

        [Required]
        [StringLength(100, ErrorMessage = "The {0} must be at least {2} characters long.", MinimumLength = 3)]
        [DataType(DataType.Password)]
        [Display(Name = "Password")]
        public string Password { get; set; }

        [DataType(DataType.Password)]
        [Display(Name = "Confirm Password")]
        [Compare("Password", ErrorMessage = "The password and confirmation password do not match.")]
        public string ConfirmPassword { get; set; }

        [Display(Name = "First Name")]
        [Required]
        public string FirstName { get; set; }

        [Display(Name = "Last Name")]
        [Required]
        public string LastName { get; set; }

        [Display(Name = "Phone")]
        [Phone]
        [DataType(DataType.PhoneNumber)]
        [Required]
        public string Phone { get; set; }

        [Display(Name = "Social Security Number")]
        [Required]
        public string SSN { get; set; }

        //public string Photo { get; set; }

        [Display(Name = "Date of Birth")]
        [Required]
        public DateTime DateOfBirth { get; set; }

        [Display(Name = "Birth Place")]
        [Required]
        public string Birthplace { get; set; }

        [Display(Name = "Address")]
        [Required]
        public string Address { get; set; }

        [Display(Name = "City")]
        [Required]
        public string City { get; set; }

        [Display(Name = "State")]
        [Required]
        public string State { get; set; }

        [Display(Name = "Zip")]
        [Required]
        [DataType(DataType.PostalCode)]
        public int ZipCode { get; set; }
    }
}
}
