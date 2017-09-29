using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ReviewableVoting.IO.Account
{
    public static class Account
    {
        /// <summary>
        /// Registers a user
        /// </summary>
        public static void RegiserUser(Models.Voter newVoter)
        {
            using (var myContext = new Entity.reviewablevotingEntities())
            {
                // Find the zip code
                var myZip = myContext.ZipCodes.FirstOrDefault(x => x.ZipCode1 == newVoter.ZipCode);
                if (myZip == null)
                {
                    throw new Exception("The zip code " + newVoter.ZipCode + " was not found in the database");
                }

                // Make sure the street address exists
                var address = myContext.StreetAddresses.FirstOrDefault(x => x.ZipCodeID == myZip.ZipCodeID && 
                                                                       x.Address == newVoter.Address);
                int voterAddress;
                if (address == null)
                {
                    var newAddress = new Entity.StreetAddress()
                    {
                        Address = newVoter.Address,
                        ZipCodeID = myZip.ZipCodeID,
                    };

                    // Create the new street address!
                    myContext.StreetAddresses.Add(newAddress);
                    myContext.SaveChanges();
                    voterAddress = newAddress.StreetAddressID;
                }
                else {
                    voterAddress = address.StreetAddressID;
                }

                // Add the voter
                var myNewVoter = new Entity.Voter()
                {
                    AspNetUsersID = newVoter.AspNetUsersID.ToString(),
                    BirthPlace = newVoter.Birthplace,
                    DOB = newVoter.DateOfBirth,
                    Email = newVoter.Email,
                    FirstName = newVoter.FirstName,
                    LastName = newVoter.LastName,
                    Phone = decimal.Parse(newVoter.Phone),
                    Private_ID = "12345",
                    SSN = newVoter.SSN     // Make sure this is unique.             
                };

                myContext.Voters.Add(myNewVoter);
                myContext.SaveChanges();

                // Save the link
                myContext.VoterAddresses.Add(new Entity.VoterAddress()
                {
                    StreetAddressID = voterAddress,
                    VoterID = myNewVoter.VoterID
                });
                myContext.SaveChanges();
            }
        }

        /// <summary>
        /// Checks to see if a social security number is being used yet
        /// </summary>
        /// <param name="ssn"></param>
        /// <returns></returns>
        public static bool IsSSNAvaliable(string ssn)
        {
            if (string.IsNullOrEmpty(ssn))
            {
                throw new ArgumentException("You must pass in a social security number");
            }

            using (var myContext = new Entity.reviewablevotingEntities())
            {
                var usersWithSSN = (from x in myContext.Voters
                                     where x.SSN == ssn.Trim().ToUpper()
                                     select x).ToList();

                return usersWithSSN.Count <= 0;
            }
        }
        

    }
}
