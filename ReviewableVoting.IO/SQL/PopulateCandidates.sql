USE [reviewablevoting]
GO
--Election level
INSERT INTO [dbo].[ElectionLevel]
           ([ElectionLevel])
     VALUES
           ('National')
GO

INSERT INTO [dbo].[Party]
           ([PartyName])
     VALUES
           ('Republican'),
		   ('Democratic'),
		   ('States'' Rights'),
		   ('Socialist Labor'),
		   ('Prohibition'),
		   ('Union'),
		   ('Communist'),
		   ('Socialist')

--Elections
INSERT INTO [dbo].[Election]
           ([ElectionID]
		   ,[BeginDate]
           ,[EndDate]
           ,[Office]
           ,[ElectionLevelID]
		   ,[PreviousVoteID])
     VALUES
           (1
		   ,'11/3/1936'
           ,'11/3/1936'
           ,'President'
           ,(SELECT ElectionLevelID FROM [dbo].ElectionLevel WHERE ElectionLevel = 'National')
		   ,1)
GO
INSERT INTO [dbo].[Election]
           ([ElectionID]
		   ,[BeginDate]
           ,[EndDate]
           ,[Office]
           ,[ElectionLevelID]
		   ,[PreviousVoteID])
     VALUES
           (2
		   ,'04/01/2017'
           ,'04/30/2017'
           ,'President'
           ,(SELECT ElectionLevelID FROM [dbo].ElectionLevel WHERE ElectionLevel = 'National'),
		   1)
GO


--Insert the candidate data
INSERT INTO [dbo].[AspNetUsers]
           ([Id]
           ,[AccessFailedCount]
           ,[ConcurrencyStamp]
           ,[Email]
           ,[EmailConfirmed]
           ,[LockoutEnabled]
           ,[LockoutEnd]
           ,[NormalizedEmail]
           ,[NormalizedUserName]
           ,[PasswordHash]
           ,[PhoneNumber]
           ,[PhoneNumberConfirmed]
           ,[SecurityStamp]
           ,[TwoFactorEnabled]
           ,[UserName])
     VALUES
           ('39be68b6-aef1-4d59-8110-e0b5bd853a35'
           ,0 
           ,'623e7c9e-b950-46b5-8999-15c74ee02087'
           ,'Dwight.Eisenhower@USA.com'
           ,1
           ,0
           ,null
           ,'DWIGHT.EISENHOWER@USA.COM'
           ,'DWIGHT.EISENHOWER@USA.COM'
           ,'AQAAAAEAACcQAAAAEHxQRkCW278WBqp3PQ47mT0NGnxcNpfSlGl21xKQLKFW+6xxysIhOHV3FR2zcMnUdg=='
           ,null
           ,0
           ,'6ffb2a55-bbd2-4252-9da9-d799bfba5f94'
           ,0
           ,'DWIGHT.EISENHOWER@USA.COM')
GO
INSERT INTO [dbo].[Voter]
           ([Email]
           ,[Phone]
           ,[FirstName]
           ,[LastName]
           ,[SSN]
           ,[Photo]
           ,[DOB]
           ,[BirthPlace]
           ,[Private_ID]
           ,[AspNetUsersID])
     VALUES
           ('DWIGHT.EISENHOWER@USA.COM'
           ,123456789
           ,'DWIGHT'
           ,'EISENHOWER'
           ,123456789
           ,null
           ,'1/1/1900'
           ,'none'
           ,1
           ,'39be68b6-aef1-4d59-8110-e0b5bd853a35')
GO
INSERT INTO [dbo].[Candidates]
           ([VoterID]
           ,[ElectionID]
           ,[PartyID]
		   ,[CandidateChecksum])
     VALUES
           ((SELECT VoterID FROM [reviewablevoting].[dbo].Voter WHERE Email = 'DWIGHT.EISENHOWER@USA.COM')
           ,2
           ,1
		   ,9505271813389268)
GO



INSERT INTO [dbo].[AspNetUsers]
           ([Id]
           ,[AccessFailedCount]
           ,[ConcurrencyStamp]
           ,[Email]
           ,[EmailConfirmed]
           ,[LockoutEnabled]
           ,[LockoutEnd]
           ,[NormalizedEmail]
           ,[NormalizedUserName]
           ,[PasswordHash]
           ,[PhoneNumber]
           ,[PhoneNumberConfirmed]
           ,[SecurityStamp]
           ,[TwoFactorEnabled]
           ,[UserName])
     VALUES
           ('39be68b6-aef1-4d59-8110-e0b5bd853a36'
           ,0 
           ,'623e7c9e-b950-46b5-8999-15c74ee02087'
           ,'Adlai.Stevenson@USA.com'
           ,1
           ,0
           ,null
           ,'ADLAI.STEVENSON@USA.COM'
           ,'ADLAI.STEVENSON@USA.COM'
           ,'AQAAAAEAACcQAAAAEHxQRkCW278WBqp3PQ47mT0NGnxcNpfSlGl21xKQLKFW+6xxysIhOHV3FR2zcMnUdg=='
           ,null
           ,0
           ,'6ffb2a55-bbd2-4252-9da9-d799bfba5f94'
           ,0
           ,'ADLAI.STEVENSON@USA.COM')
GO
INSERT INTO [dbo].[Voter]
           ([Email]
           ,[Phone]
           ,[FirstName]
           ,[LastName]
           ,[SSN]
           ,[Photo]
           ,[DOB]
           ,[BirthPlace]
           ,[Private_ID]
           ,[AspNetUsersID])
     VALUES
           ('ADLAI.STEVENSON@USA.COM'
           ,123456789
           ,'ADLAI'
           ,'STEVENSON'
           ,123456788
           ,null
           ,'1/1/1900'
           ,'none'
           ,1
           ,'39be68b6-aef1-4d59-8110-e0b5bd853a36')
GO
INSERT INTO [dbo].[Candidates]
           ([VoterID]
           ,[ElectionID]
           ,[PartyID]
		   ,[CandidateChecksum])
     VALUES
           ((SELECT VoterID FROM [reviewablevoting].[dbo].Voter WHERE Email = 'ADLAI.STEVENSON@USA.COM')
           ,2
           ,2
		   ,7700292347394348)
GO



INSERT INTO [dbo].[AspNetUsers]
           ([Id]
           ,[AccessFailedCount]
           ,[ConcurrencyStamp]
           ,[Email]
           ,[EmailConfirmed]
           ,[LockoutEnabled]
           ,[LockoutEnd]
           ,[NormalizedEmail]
           ,[NormalizedUserName]
           ,[PasswordHash]
           ,[PhoneNumber]
           ,[PhoneNumberConfirmed]
           ,[SecurityStamp]
           ,[TwoFactorEnabled]
           ,[UserName])
     VALUES
           ('39be68b6-aef1-4d59-8110-e0b5bd853a37'
           ,0 
           ,'623e7c9e-b950-46b5-8999-15c74ee02087'
           ,'Thomas.Andrews@USA.com'
           ,1
           ,0
           ,null
           ,'THOMAS.ANDREWS@USA.COM'
           ,'THOMAS.ANDREWS@USA.COM'
           ,'AQAAAAEAACcQAAAAEHxQRkCW278WBqp3PQ47mT0NGnxcNpfSlGl21xKQLKFW+6xxysIhOHV3FR2zcMnUdg=='
           ,null
           ,0
           ,'6ffb2a55-bbd2-4252-9da9-d799bfba5f94'
           ,0
           ,'THOMAS.ANDREWS@USA.COM')
GO
INSERT INTO [dbo].[Voter]
           ([Email]
           ,[Phone]
           ,[FirstName]
           ,[LastName]
           ,[SSN]
           ,[Photo]
           ,[DOB]
           ,[BirthPlace]
           ,[Private_ID]
           ,[AspNetUsersID])
     VALUES
           ('THOMAS.ANDREWS@USA.COM'
           ,123456789
           ,'THOMAS'
           ,'ANDREWS'
           ,123456787
           ,null
           ,'1/1/1900'
           ,'none'
           ,1
           ,'39be68b6-aef1-4d59-8110-e0b5bd853a37')
GO
INSERT INTO [dbo].[Candidates]
           ([VoterID]
           ,[ElectionID]
           ,[PartyID]
		   ,[CandidateChecksum])
     VALUES
           ((SELECT VoterID FROM [reviewablevoting].[dbo].Voter WHERE Email = 'THOMAS.ANDREWS@USA.COM')
           ,2
           ,3
		   ,2753574786557108)
GO





INSERT INTO [dbo].[AspNetUsers]
           ([Id]
           ,[AccessFailedCount]
           ,[ConcurrencyStamp]
           ,[Email]
           ,[EmailConfirmed]
           ,[LockoutEnabled]
           ,[LockoutEnd]
           ,[NormalizedEmail]
           ,[NormalizedUserName]
           ,[PasswordHash]
           ,[PhoneNumber]
           ,[PhoneNumberConfirmed]
           ,[SecurityStamp]
           ,[TwoFactorEnabled]
           ,[UserName])
     VALUES
           ('39be68b6-aef1-4d59-8110-e0b5bd853a38'
           ,0 
           ,'623e7c9e-b950-46b5-8999-15c74ee02087'
           ,'Eric.Hass@USA.com'
           ,1
           ,0
           ,null
           ,'ERIC.HASS@USA.COM'
           ,'ERIC.HASS@USA.COM'
           ,'AQAAAAEAACcQAAAAEHxQRkCW278WBqp3PQ47mT0NGnxcNpfSlGl21xKQLKFW+6xxysIhOHV3FR2zcMnUdg=='
           ,null
           ,0
           ,'6ffb2a55-bbd2-4252-9da9-d799bfba5f94'
           ,0
           ,'ERIC.HASS@USA.COM')
GO
INSERT INTO [dbo].[Voter]
           ([Email]
           ,[Phone]
           ,[FirstName]
           ,[LastName]
           ,[SSN]
           ,[Photo]
           ,[DOB]
           ,[BirthPlace]
           ,[Private_ID]
           ,[AspNetUsersID])
     VALUES
           ('ERIC.HASS@USA.COM'
           ,123456789
           ,'ERIC'
           ,'HASS'
           ,123456786
           ,null
           ,'1/1/1900'
           ,'none'
           ,1
           ,'39be68b6-aef1-4d59-8110-e0b5bd853a38')
GO
INSERT INTO [dbo].[Candidates]
           ([VoterID]
           ,[ElectionID]
           ,[PartyID]
		   ,[CandidateChecksum])
     VALUES
           ((SELECT VoterID FROM [reviewablevoting].[dbo].Voter WHERE Email = 'ERIC.HASS@USA.COM')
           ,2
           ,4
		   ,7142768706562232)
GO





INSERT INTO [dbo].[AspNetUsers]
           ([Id]
           ,[AccessFailedCount]
           ,[ConcurrencyStamp]
           ,[Email]
           ,[EmailConfirmed]
           ,[LockoutEnabled]
           ,[LockoutEnd]
           ,[NormalizedEmail]
           ,[NormalizedUserName]
           ,[PasswordHash]
           ,[PhoneNumber]
           ,[PhoneNumberConfirmed]
           ,[SecurityStamp]
           ,[TwoFactorEnabled]
           ,[UserName])
     VALUES
           ('39be68b6-aef1-4d59-8110-e0b5bd853a39'
           ,0 
           ,'623e7c9e-b950-46b5-8999-15c74ee02087'
           ,'Enoch.Holtwick@USA.com'
           ,1
           ,0
           ,null
           ,'ENOCH.HOLTWICK@USA.COM'
           ,'ENOCH.HOLTWICK@USA.COM'
           ,'AQAAAAEAACcQAAAAEHxQRkCW278WBqp3PQ47mT0NGnxcNpfSlGl21xKQLKFW+6xxysIhOHV3FR2zcMnUdg=='
           ,null
           ,0
           ,'6ffb2a55-bbd2-4252-9da9-d799bfba5f94'
           ,0
           ,'ENOCH.HOLTWICK@USA.COM')
GO
INSERT INTO [dbo].[Voter]
           ([Email]
           ,[Phone]
           ,[FirstName]
           ,[LastName]
           ,[SSN]
           ,[Photo]
           ,[DOB]
           ,[BirthPlace]
           ,[Private_ID]
           ,[AspNetUsersID])
     VALUES
           ('ENOCH.HOLTWICK@USA.COM'
           ,123456789
           ,'ENOCH'
           ,'HOLTWICK'
           ,123456785
           ,null
           ,'1/1/1900'
           ,'none'
           ,1
           ,'39be68b6-aef1-4d59-8110-e0b5bd853a39')
GO
INSERT INTO [dbo].[Candidates]
           ([VoterID]
           ,[ElectionID]
           ,[PartyID]
		   ,[CandidateChecksum])
     VALUES
           ((SELECT VoterID FROM [reviewablevoting].[dbo].Voter WHERE Email = 'ENOCH.HOLTWICK@USA.COM')
           ,2
           ,5
		   ,7115464824907495)
GO



INSERT INTO [dbo].[AspNetUsers]
           ([Id]
           ,[AccessFailedCount]
           ,[ConcurrencyStamp]
           ,[Email]
           ,[EmailConfirmed]
           ,[LockoutEnabled]
           ,[LockoutEnd]
           ,[NormalizedEmail]
           ,[NormalizedUserName]
           ,[PasswordHash]
           ,[PhoneNumber]
           ,[PhoneNumberConfirmed]
           ,[SecurityStamp]
           ,[TwoFactorEnabled]
           ,[UserName])
     VALUES
           ('39be68b6-aef1-4d59-8110-e0b5bd853a40'
           ,0 
           ,'623e7c9e-b950-46b5-8999-15c74ee02087'
           ,'Franklin.Roosevelt@USA.com'
           ,1
           ,0
           ,null
           ,'FRANKLIN.ROOSEVELT@USA.COM'
           ,'FRANKLIN.ROOSEVELT@USA.COM'
           ,'AQAAAAEAACcQAAAAEHxQRkCW278WBqp3PQ47mT0NGnxcNpfSlGl21xKQLKFW+6xxysIhOHV3FR2zcMnUdg=='
           ,null
           ,0
           ,'6ffb2a55-bbd2-4252-9da9-d799bfba5f94'
           ,0
           ,'FRANKLIN.ROOSEVELT@USA.COM')
GO
INSERT INTO [dbo].[Voter]
           ([Email]
           ,[Phone]
           ,[FirstName]
           ,[LastName]
           ,[SSN]
           ,[Photo]
           ,[DOB]
           ,[BirthPlace]
           ,[Private_ID]
           ,[AspNetUsersID])
     VALUES
           ('FRANKLIN.ROOSEVELT@USA.COM'
           ,123456789
           ,'FRANKLIN'
           ,'ROOSEVELT'
           ,123456784
           ,null
           ,'1/1/1900'
           ,'none'
           ,1
           ,'39be68b6-aef1-4d59-8110-e0b5bd853a40')
GO
INSERT INTO [dbo].[Candidates]
           ([VoterID]
           ,[ElectionID]
           ,[PartyID]
		   ,[CandidateChecksum])
     VALUES
           ((SELECT VoterID FROM [reviewablevoting].[dbo].Voter WHERE Email = 'FRANKLIN.ROOSEVELT@USA.COM')
           ,1
           ,2
		   ,3589691331477075)
GO






INSERT INTO [dbo].[AspNetUsers]
           ([Id]
           ,[AccessFailedCount]
           ,[ConcurrencyStamp]
           ,[Email]
           ,[EmailConfirmed]
           ,[LockoutEnabled]
           ,[LockoutEnd]
           ,[NormalizedEmail]
           ,[NormalizedUserName]
           ,[PasswordHash]
           ,[PhoneNumber]
           ,[PhoneNumberConfirmed]
           ,[SecurityStamp]
           ,[TwoFactorEnabled]
           ,[UserName])
     VALUES
           ('39be68b6-aef1-4d59-8110-e0b5bd853a41'
           ,0 
           ,'623e7c9e-b950-46b5-8999-15c74ee02087'
           ,'William.Lemke@USA.com'
           ,1
           ,0
           ,null
           ,'WILLIAM.LEMKE@USA.COM'
           ,'WILLIAM.LEMKE@USA.COM'
           ,'AQAAAAEAACcQAAAAEHxQRkCW278WBqp3PQ47mT0NGnxcNpfSlGl21xKQLKFW+6xxysIhOHV3FR2zcMnUdg=='
           ,null
           ,0
           ,'6ffb2a55-bbd2-4252-9da9-d799bfba5f94'
           ,0
           ,'WILLIAM.LEMKE@USA.COM')
GO
INSERT INTO [dbo].[Voter]
           ([Email]
           ,[Phone]
           ,[FirstName]
           ,[LastName]
           ,[SSN]
           ,[Photo]
           ,[DOB]
           ,[BirthPlace]
           ,[Private_ID]
           ,[AspNetUsersID])
     VALUES
           ('WILLIAM.LEMKE@USA.COM'
           ,123456789
           ,'WILLIAM'
           ,'LEMKE'
           ,123456783
           ,null
           ,'1/1/1900'
           ,'none'
           ,1
           ,'39be68b6-aef1-4d59-8110-e0b5bd853a41')
GO
INSERT INTO [dbo].[Candidates]
           ([VoterID]
           ,[ElectionID]
           ,[PartyID],[CandidateChecksum])
     VALUES
           ((SELECT VoterID FROM [reviewablevoting].[dbo].Voter WHERE Email = 'WILLIAM.LEMKE@USA.COM')
           ,1
           ,6
		   ,5428149822914903)
GO




INSERT INTO [dbo].[AspNetUsers]
           ([Id]
           ,[AccessFailedCount]
           ,[ConcurrencyStamp]
           ,[Email]
           ,[EmailConfirmed]
           ,[LockoutEnabled]
           ,[LockoutEnd]
           ,[NormalizedEmail]
           ,[NormalizedUserName]
           ,[PasswordHash]
           ,[PhoneNumber]
           ,[PhoneNumberConfirmed]
           ,[SecurityStamp]
           ,[TwoFactorEnabled]
           ,[UserName])
     VALUES
           ('39be68b6-aef1-4d59-8110-e0b5bd853a42'
           ,0 
           ,'623e7c9e-b950-46b5-8999-15c74ee02087'
           ,'Norman.Thomas@USA.com'
           ,1
           ,0
           ,null
           ,'NORMAN.THOMAS@USA.COM'
           ,'NORMAN.THOMAS@USA.COM'
           ,'AQAAAAEAACcQAAAAEHxQRkCW278WBqp3PQ47mT0NGnxcNpfSlGl21xKQLKFW+6xxysIhOHV3FR2zcMnUdg=='
           ,null
           ,0
           ,'6ffb2a55-bbd2-4252-9da9-d799bfba5f94'
           ,0
           ,'NORMAN.THOMAS@USA.COM')
GO
INSERT INTO [dbo].[Voter]
           ([Email]
           ,[Phone]
           ,[FirstName]
           ,[LastName]
           ,[SSN]
           ,[Photo]
           ,[DOB]
           ,[BirthPlace]
           ,[Private_ID]
           ,[AspNetUsersID])
     VALUES
           ('NORMAN.THOMAS@USA.COM'
           ,123456789
           ,'NORMAN'
           ,'THOMAS'
           ,123456782
           ,null
           ,'1/1/1900'
           ,'none'
           ,1
           ,'39be68b6-aef1-4d59-8110-e0b5bd853a42')
GO
INSERT INTO [dbo].[Candidates]
           ([VoterID]
           ,[ElectionID]
           ,[PartyID],[CandidateChecksum])
     VALUES
           ((SELECT VoterID FROM [reviewablevoting].[dbo].Voter WHERE Email = 'NORMAN.THOMAS@USA.COM')
           ,1
           ,8
		   ,9379840819345297)
GO





INSERT INTO [dbo].[AspNetUsers]
           ([Id]
           ,[AccessFailedCount]
           ,[ConcurrencyStamp]
           ,[Email]
           ,[EmailConfirmed]
           ,[LockoutEnabled]
           ,[LockoutEnd]
           ,[NormalizedEmail]
           ,[NormalizedUserName]
           ,[PasswordHash]
           ,[PhoneNumber]
           ,[PhoneNumberConfirmed]
           ,[SecurityStamp]
           ,[TwoFactorEnabled]
           ,[UserName])
     VALUES
           ('39be68b6-aef1-4d59-8110-e0b5bd853a43'
           ,0 
           ,'623e7c9e-b950-46b5-8999-15c74ee02087'
           ,'Earl.Browder@USA.com'
           ,1
           ,0
           ,null
           ,'EARL.BROWDER@USA.COM'
           ,'EARL.BROWDER@USA.COM'
           ,'AQAAAAEAACcQAAAAEHxQRkCW278WBqp3PQ47mT0NGnxcNpfSlGl21xKQLKFW+6xxysIhOHV3FR2zcMnUdg=='
           ,null
           ,0
           ,'6ffb2a55-bbd2-4252-9da9-d799bfba5f94'
           ,0
           ,'EARL.BROWDER@USA.COM')
GO
INSERT INTO [dbo].[Voter]
           ([Email]
           ,[Phone]
           ,[FirstName]
           ,[LastName]
           ,[SSN]
           ,[Photo]
           ,[DOB]
           ,[BirthPlace]
           ,[Private_ID]
           ,[AspNetUsersID])
     VALUES
           ('EARL.BROWDER@USA.COM'
           ,123456789
           ,'EARL'
           ,'BROWDER'
           ,123456781
           ,null
           ,'1/1/1900'
           ,'none'
           ,1
           ,'39be68b6-aef1-4d59-8110-e0b5bd853a43')
GO
INSERT INTO [dbo].[Candidates]
           ([VoterID]
           ,[ElectionID]
           ,[PartyID],[CandidateChecksum])
     VALUES
           ((SELECT VoterID FROM [reviewablevoting].[dbo].Voter WHERE Email = 'EARL.BROWDER@USA.COM')
           ,1
           ,7
		   ,1499787456625139)
GO


INSERT INTO [dbo].[AspNetUsers]
           ([Id]
           ,[AccessFailedCount]
           ,[ConcurrencyStamp]
           ,[Email]
           ,[EmailConfirmed]
           ,[LockoutEnabled]
           ,[LockoutEnd]
           ,[NormalizedEmail]
           ,[NormalizedUserName]
           ,[PasswordHash]
           ,[PhoneNumber]
           ,[PhoneNumberConfirmed]
           ,[SecurityStamp]
           ,[TwoFactorEnabled]
           ,[UserName])
     VALUES
           ('39be68b6-aef1-4d59-8110-e0b5bd853a44'
           ,0 
           ,'623e7c9e-b950-46b5-8999-15c74ee02087'
           ,'David.Colvin@USA.com'
           ,1
           ,0
           ,null
           ,'DAVID.COLVIN@USA.COM'
           ,'DAVID.COLVIN@USA.COM'
           ,'AQAAAAEAACcQAAAAEHxQRkCW278WBqp3PQ47mT0NGnxcNpfSlGl21xKQLKFW+6xxysIhOHV3FR2zcMnUdg=='
           ,null
           ,0
           ,'6ffb2a55-bbd2-4252-9da9-d799bfba5f94'
           ,0
           ,'DAVID.COLVIN@USA.COM')
GO
INSERT INTO [dbo].[Voter]
           ([Email]
           ,[Phone]
           ,[FirstName]
           ,[LastName]
           ,[SSN]
           ,[Photo]
           ,[DOB]
           ,[BirthPlace]
           ,[Private_ID]
           ,[AspNetUsersID])
     VALUES
           ('DAVID.COLVIN@USA.COM'
           ,123456789
           ,'DAVID'
           ,'COLVIN'
           ,123456780
           ,null
           ,'1/1/1900'
           ,'none'
           ,1
           ,'39be68b6-aef1-4d59-8110-e0b5bd853a44')
GO
INSERT INTO [dbo].[Candidates]
           ([VoterID]
           ,[ElectionID]
           ,[PartyID],[CandidateChecksum])
     VALUES
           ((SELECT VoterID FROM [reviewablevoting].[dbo].Voter WHERE Email = 'DAVID.COLVIN@USA.COM')
           ,1
           ,5
		   ,335068099060937)
GO



INSERT INTO [dbo].[AspNetUsers]
           ([Id]
           ,[AccessFailedCount]
           ,[ConcurrencyStamp]
           ,[Email]
           ,[EmailConfirmed]
           ,[LockoutEnabled]
           ,[LockoutEnd]
           ,[NormalizedEmail]
           ,[NormalizedUserName]
           ,[PasswordHash]
           ,[PhoneNumber]
           ,[PhoneNumberConfirmed]
           ,[SecurityStamp]
           ,[TwoFactorEnabled]
           ,[UserName])
     VALUES
           ('39be68b6-aef1-4d59-8110-e0b5bd853a45'
           ,0 
           ,'623e7c9e-b950-46b5-8999-15c74ee02087'
           ,'John.Aiken@USA.com'
           ,1
           ,0
           ,null
           ,'JOHN.AIKEN@USA.COM'
           ,'JOHN.AIKEN@USA.COM'
           ,'AQAAAAEAACcQAAAAEHxQRkCW278WBqp3PQ47mT0NGnxcNpfSlGl21xKQLKFW+6xxysIhOHV3FR2zcMnUdg=='
           ,null
           ,0
           ,'6ffb2a55-bbd2-4252-9da9-d799bfba5f94'
           ,0
           ,'JOHN.AIKEN@USA.COM')
GO
INSERT INTO [dbo].[Voter]
           ([Email]
           ,[Phone]
           ,[FirstName]
           ,[LastName]
           ,[SSN]
           ,[Photo]
           ,[DOB]
           ,[BirthPlace]
           ,[Private_ID]
           ,[AspNetUsersID])
     VALUES
           ('JOHN.AIKEN@USA.COM'
           ,123456789
           ,'JOHN'
           ,'AIKEN'
           ,123456790
           ,null
           ,'1/1/1900'
           ,'none'
           ,1
           ,'39be68b6-aef1-4d59-8110-e0b5bd853a45')
GO
INSERT INTO [dbo].[Candidates]
           ([VoterID]
           ,[ElectionID]
           ,[PartyID],[CandidateChecksum])
     VALUES
           ((SELECT VoterID FROM [reviewablevoting].[dbo].Voter WHERE Email = 'JOHN.AIKEN@USA.COM')
           ,1
           ,4
		   ,8114607203915256)
GO