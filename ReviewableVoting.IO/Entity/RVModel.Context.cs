﻿//------------------------------------------------------------------------------
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
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class reviewablevotingEntities : DbContext
    {
        public reviewablevotingEntities()
            : base("name=reviewablevotingEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<AspNetRoleClaim> AspNetRoleClaims { get; set; }
        public virtual DbSet<AspNetRole> AspNetRoles { get; set; }
        public virtual DbSet<AspNetUserClaim> AspNetUserClaims { get; set; }
        public virtual DbSet<AspNetUserLogin> AspNetUserLogins { get; set; }
        public virtual DbSet<AspNetUser> AspNetUsers { get; set; }
        public virtual DbSet<Candidate> Candidates { get; set; }
        public virtual DbSet<Election> Elections { get; set; }
        public virtual DbSet<ElectionLevel> ElectionLevels { get; set; }
        public virtual DbSet<Party> Parties { get; set; }
        public virtual DbSet<StreetAddress> StreetAddresses { get; set; }
        public virtual DbSet<Voter> Voters { get; set; }
        public virtual DbSet<VoterAddress> VoterAddresses { get; set; }
        public virtual DbSet<ZipCode> ZipCodes { get; set; }
        public virtual DbSet<UnconfirmedVote> UnconfirmedVotes { get; set; }
        public virtual DbSet<Vote> Votes { get; set; }
    }
}
