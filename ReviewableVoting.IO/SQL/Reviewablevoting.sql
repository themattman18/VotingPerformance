USE [master]
GO

DECLARE @kill varchar(8000) = '';  
SELECT @kill = @kill + 'kill ' + CONVERT(varchar(5), session_id) + ';'  
FROM sys.dm_exec_sessions
WHERE database_id  = db_id('reviewablevoting')

EXEC(@kill);
go

DROP DATABASE [reviewablevoting]
/****** Object:  Database [reviewablevoting]    Script Date: 2/9/2017 10:19:32 PM ******/
CREATE DATABASE [reviewablevoting]
 
USE [reviewablevoting]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 4/10/2017 11:35:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_HistoryRow] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 4/10/2017 11:35:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
	[RoleId] [nvarchar](450) NULL,
 CONSTRAINT [PK_IdentityRoleClaim<string>] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 4/10/2017 11:35:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](450) NOT NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
 CONSTRAINT [PK_IdentityRole] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 4/10/2017 11:35:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NULL,
 CONSTRAINT [PK_IdentityUserClaim<string>] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 4/10/2017 11:35:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](450) NOT NULL,
	[ProviderKey] [nvarchar](450) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NULL,
 CONSTRAINT [PK_IdentityUserLogin<string>] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 4/10/2017 11:35:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_IdentityUserRole<string>] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 4/10/2017 11:35:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[UserName] [nvarchar](256) NULL,
 CONSTRAINT [PK_ApplicationUser] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Candidates]    Script Date: 4/10/2017 11:35:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Candidates](
	[CandidateID] [int] IDENTITY(1,1) NOT NULL,
	[VoterID] [int] NULL,
	[ElectionID] [int] NULL,
	[PartyID] [int] NULL,
	[CandidateChecksum] [BigInt] NOT NULL,
 CONSTRAINT [PK__Candidat__DF539BFC91B8DCE7] PRIMARY KEY CLUSTERED 
(
	[CandidateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Election]    Script Date: 4/10/2017 11:35:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Election](
	[ElectionID] [int] NOT NULL,
	[BeginDate] [date] NULL,
	[EndDate] [date] NULL,
	[Office] [varchar](20) NULL,
	[ElectionLevelID] [int] NULL,
	[PreviousVoteID] [INT] NOT NULL,
 CONSTRAINT [PK__Election__C626C7C675C7DD12] PRIMARY KEY CLUSTERED 
(
	[ElectionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ElectionLevel]    Script Date: 4/10/2017 11:35:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ElectionLevel](
	[ElectionLevelID] [int] IDENTITY(1,1) NOT NULL,
	[ElectionLevel] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ElectionLevelID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Party]    Script Date: 4/10/2017 11:35:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Party](
	[PartyID] [int] IDENTITY(1,1) NOT NULL,
	[PartyName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Party] PRIMARY KEY CLUSTERED 
(
	[PartyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[StreetAddress]    Script Date: 4/10/2017 11:35:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[StreetAddress](
	[StreetAddressID] [int] IDENTITY(1,1) NOT NULL,
	[Address] [varchar](50) NOT NULL,
	[ZipCodeID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[StreetAddressID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UnconfirmedVotes]    Script Date: 4/10/2017 11:35:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UnconfirmedVotes](
	[UnconfirmedVoteID] [int] IDENTITY(1,1) NOT NULL,
	[CandidateID] [int] NOT NULL,
	[AuthToken] [uniqueidentifier] NOT NULL,
	[TimeStamp] [datetime] NOT NULL,
	[TimeToLive] [int] NOT NULL,
	[VoteAddEnd] [varchar](max) NOT NULL
 CONSTRAINT [PK_UnconfirmedVotes] PRIMARY KEY CLUSTERED 
(
	[UnconfirmedVoteID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Vote]    Script Date: 4/10/2017 11:35:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vote](
	[VoteID] [int] IDENTITY(1,1) NOT NULL,
	[TimeStamp] [date] NULL,
	[CandidateID] [int] NULL,
	[voterID] [int] NULL,
	[VoteCheckSum] varchar(MAX) NOT NULL,
	[CheckSum] varchar(MAX) NOT NULL,
	[CumulativeCheckSum] varchar(MAX) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[VoteID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Voter]    Script Date: 4/10/2017 11:35:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Voter](
	[VoterID] [int] IDENTITY(1,1) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Phone] [decimal](10, 0) NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[SSN] [nvarchar](9) NOT NULL,
	[Photo] [image] NULL,
	[DOB] [date] NOT NULL,
	[BirthPlace] [varchar](25) NOT NULL,
	[Private_ID] [varchar](15) NOT NULL,
	[AspNetUsersID] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK__Voter__12D25BD82128786D] PRIMARY KEY CLUSTERED 
(
	[VoterID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[VoterAddress]    Script Date: 4/10/2017 11:35:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VoterAddress](
	[VoterAddressID] [int] IDENTITY(1,1) NOT NULL,
	[VoterID] [int] NOT NULL,
	[StreetAddressID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[VoterAddressID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ZipCode]    Script Date: 4/10/2017 11:35:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ZipCode](
	[ZipCodeID] [int] IDENTITY(1,1) NOT NULL,
	[ZipCode] [int] NULL,
	[City] [varchar](200) NULL,
	[State] [varchar](3) NULL,
PRIMARY KEY CLUSTERED 
(
	[ZipCodeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[AspNetRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_IdentityRoleClaim<string>_IdentityRole_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
GO
ALTER TABLE [dbo].[AspNetRoleClaims] CHECK CONSTRAINT [FK_IdentityRoleClaim<string>_IdentityRole_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_IdentityUserClaim<string>_ApplicationUser_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_IdentityUserClaim<string>_ApplicationUser_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_IdentityUserLogin<string>_ApplicationUser_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_IdentityUserLogin<string>_ApplicationUser_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_IdentityUserRole<string>_ApplicationUser_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_IdentityUserRole<string>_ApplicationUser_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_IdentityUserRole<string>_IdentityRole_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_IdentityUserRole<string>_IdentityRole_RoleId]
GO
ALTER TABLE [dbo].[Candidates]  WITH CHECK ADD  CONSTRAINT [Election_fk] FOREIGN KEY([ElectionID])
REFERENCES [dbo].[Election] ([ElectionID])
GO
ALTER TABLE [dbo].[Candidates] CHECK CONSTRAINT [Election_fk]
GO
ALTER TABLE [dbo].[Candidates]  WITH CHECK ADD  CONSTRAINT [Party_fk] FOREIGN KEY([PartyID])
REFERENCES [dbo].[Party] ([PartyID])
GO
ALTER TABLE [dbo].[Candidates] CHECK CONSTRAINT [Party_fk]
GO
ALTER TABLE [dbo].[Candidates]  WITH CHECK ADD  CONSTRAINT [VoterID_fk] FOREIGN KEY([VoterID])
REFERENCES [dbo].[Voter] ([VoterID])
GO
ALTER TABLE [dbo].[Candidates] CHECK CONSTRAINT [VoterID_fk]
GO
ALTER TABLE [dbo].[Election]  WITH CHECK ADD  CONSTRAINT [ElectionLevel_fk] FOREIGN KEY([ElectionLevelID])
REFERENCES [dbo].[ElectionLevel] ([ElectionLevelID])
GO
ALTER TABLE [dbo].[Election] CHECK CONSTRAINT [ElectionLevel_fk]
GO
ALTER TABLE [dbo].[StreetAddress]  WITH CHECK ADD  CONSTRAINT [ZipCode_fk] FOREIGN KEY([ZipCodeID])
REFERENCES [dbo].[ZipCode] ([ZipCodeID])
GO
ALTER TABLE [dbo].[StreetAddress] CHECK CONSTRAINT [ZipCode_fk]
GO
ALTER TABLE [dbo].[UnconfirmedVotes]  WITH CHECK ADD  CONSTRAINT [FK_UnconfirmedVotes_Candidates] FOREIGN KEY([CandidateID])
REFERENCES [dbo].[Candidates] ([CandidateID])
GO
ALTER TABLE [dbo].[UnconfirmedVotes] CHECK CONSTRAINT [FK_UnconfirmedVotes_Candidates]
GO
ALTER TABLE [dbo].[Vote]  WITH CHECK ADD  CONSTRAINT [CandidateID_fk] FOREIGN KEY([CandidateID])
REFERENCES [dbo].[Candidates] ([CandidateID])
GO
ALTER TABLE [dbo].[Vote] CHECK CONSTRAINT [CandidateID_fk]
GO
ALTER TABLE [dbo].[Vote]  WITH CHECK ADD  CONSTRAINT [VotersID_fk] FOREIGN KEY([voterID])
REFERENCES [dbo].[Voter] ([VoterID])
GO
ALTER TABLE [dbo].[Vote] CHECK CONSTRAINT [VotersID_fk]
GO
ALTER TABLE [dbo].[Voter]  WITH CHECK ADD  CONSTRAINT [FK_Voter_ASPUser] FOREIGN KEY([AspNetUsersID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Voter] CHECK CONSTRAINT [FK_Voter_ASPUser]
GO
ALTER TABLE [dbo].[VoterAddress]  WITH CHECK ADD  CONSTRAINT [StreetAddress_fk] FOREIGN KEY([StreetAddressID])
REFERENCES [dbo].[StreetAddress] ([StreetAddressID])
GO
ALTER TABLE [dbo].[VoterAddress] CHECK CONSTRAINT [StreetAddress_fk]
GO
ALTER TABLE [dbo].[VoterAddress]  WITH CHECK ADD  CONSTRAINT [VoterHistoryID_fk] FOREIGN KEY([VoterID])
REFERENCES [dbo].[Voter] ([VoterID])
GO
ALTER TABLE [dbo].[VoterAddress] CHECK CONSTRAINT [VoterHistoryID_fk]
GO
