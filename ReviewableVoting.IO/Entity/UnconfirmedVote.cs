//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace ReviewableVoting.IO.Entity
{
    using System;
    using System.Collections.Generic;
    
    public partial class UnconfirmedVote
    {
        public int UnconfirmedVoteID { get; set; }
        public int CandidateID { get; set; }
        public System.Guid AuthToken { get; set; }
        public System.DateTime TimeStamp { get; set; }
        public int TimeToLive { get; set; }
        public string VoteAddEnd { get; set; }
    
        public virtual Candidate Candidate { get; set; }
    }
}
