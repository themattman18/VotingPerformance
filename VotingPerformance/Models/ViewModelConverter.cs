using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using VotingPerformance.Models;

namespace ReviewableVoting.Models
{
    public class ViewModelConverter
    {
        /// <summary>
        /// Converts a view model into a voter model
        /// </summary>
        /// <param name="viewModel"></param>
        /// <returns></returns>
        public static IO.Models.Voter ToVoterModel(RegisterViewModel viewModel, Guid newUserId)
        {
            ReviewableVoting.IO.Models.Voter newVoter = new IO.Models.Voter()
            {
                AspNetUsersID = newUserId,
                Birthplace = viewModel.Birthplace,
                DateOfBirth = viewModel.DateOfBirth,
                Email = viewModel.Email,
                FirstName = viewModel.FirstName,
                LastName = viewModel.LastName,
                Phone = viewModel.Phone,
                //Photo = null,
                SSN = viewModel.SSN,
                Address = viewModel.Address,
                City = viewModel.City,
                State = viewModel.State,
                ZipCode = viewModel.ZipCode
            };

            return newVoter;
        }
    }
}
