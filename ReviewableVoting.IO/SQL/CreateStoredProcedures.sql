USE [reviewablevoting]
GO

/****** Object:  StoredProcedure [dbo].[CastVote]    Script Date: 4/24/2017 11:20:55 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Matthew Peterson
-- Create date: 4/24/2017
-- Description:	Casts a vote for an election
-- =============================================
CREATE PROCEDURE [dbo].[CastVote] 
	-- Add the parameters for the stored procedure here
	@voteAuthToken UniqueIdentifier, 
	@userName varchar(200),
	@CandidateVoteCheckSum VARCHAR(MAX),
	@ElectionCheckSum VARCHAR(MAX)
AS
BEGIN

BEGIN TRY
	BEGIN TRANSACTION

		DECLARE @voterID int;    -- ID of the voter 
		DECLARE @myTempVote TABLE
		(
			UnconfirmedVoteID int,
			CandidateID int,
			AuthToken uniqueidentifier,
			TimeStamp datetime,
			TimeToLive int,
			VoteAddEnd varchar(max)
		);

		SET @voterID = (SELECT Voter.VoterID
						FROM Voter
						WHERE Voter.Email = @userName)

		-- Get the temp vote
		INSERT INTO @myTempVote
		SELECT TOP 1 *
		FROM UnconfirmedVotes
		WHERE AuthToken = @voteAuthToken;

		-- Throw an error if there isn't any temp vote
		IF((SELECT COUNT(*) FROM @myTempVote) < 0)
			THROW 50001, 'NO TEMP VOTE', 1;

		-- Make sure the token hasn't expired yet
		IF(DATEADD(minute, (SELECT TimeToLive FROM @myTempVote), (SELECT TimeStamp FROM @myTempVote)) < GETDATE())
			THROW 50002, 'TEMP VOTE TOKEN EXPIRED', 1;

		INSERT INTO Vote([TimeStamp]
						,[CandidateID]
						,[voterID]
						,[VoteCheckSum]
						,[CheckSum]
						,[CumulativeCheckSum])
		VALUES (GETDATE(),
				(SELECT CandidateID FROM @myTempVote),
				@voterID,
				(SELECT VoteAddEnd FROM @myTempVote),
				@CandidateVoteCheckSum,
				@ElectionCheckSum);

		-- Update the previous vote
		UPDATE Election
		SET PreviousVoteID = @@IDENTITY
		WHERE ElectionID = (SELECT E.ElectionID 
							FROM Election AS E
								 INNER JOIN Candidates AS C ON C.ElectionID = E.ElectionID
							WHERE C.CandidateID = (SELECT CandidateID FROM @myTempVote))

		DELETE FROM UnconfirmedVotes
		WHERE AuthToken = @voteAuthToken

	-- SELECT the data for the vote receipt
	SELECT V.FirstName, V.LastName, P.PartyName
	FROM Candidates AS C
		INNER JOIN Voter AS V ON C.VoterID = V.VoterID
		INNER JOIN Party AS P ON P.PartyID = C.PartyID
	WHERE C.CandidateID = (SELECT CandidateID FROM @myTempVote)


	COMMIT TRANSACTION -- Hotdog! We made it to the end so commit the trans
 END TRY
BEGIN CATCH
	-- Bad juju so rollback the vote and rethrow the exception
	ROLLBACK TRANSACTION;
	THROW;

END CATCH	
END
GO


USE [reviewablevoting]
GO

/****** Object:  StoredProcedure [dbo].[GetElectionResults]    Script Date: 5/1/2017 9:46:45 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Matthew Peterson
-- Create date: 4/30/17
-- Description:	Gets the election results
-- =============================================
CREATE PROCEDURE [dbo].[GetElectionResults]
	-- Add the parameters for the stored procedure here
	@electionID int = 0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	-- Throw an error if there isn't any temp vote
	IF(@electionID < 1)
		THROW 50001, 'You must specify a non-negitive election', 1;

    -- Insert statements for procedure here
	SELECT v.VoteID, 
		zip.State, 
		(SELECT FirstName FROM Voter WHERE VoterID = c.VoterID) AS FirstName,
		(SELECT LastName FROM Voter WHERE VoterID = c.VoterID) AS LastName,
		p.PartyName,
		v.CheckSum,
		v.CumulativeCheckSum
	FROM vote AS v
		INNER JOIN Candidates    AS c     ON c.CandidateID = v.CandidateID
		INNER JOIN Party         AS p     ON p.PartyID = c.PartyID
		INNER JOIN Election      AS e     ON e.ElectionID = c.ElectionID
		INNER JOIN Voter         AS voter ON voter.VoterID = v.voterID
		INNER JOIN VoterAddress  AS va    ON va.VoterID = voter.VoterID
		INNER JOIN StreetAddress AS sa    ON sa.StreetAddressID = va.StreetAddressID
		INNER JOIN ZipCode       AS zip   ON zip.ZipCodeID = sa.ZipCodeID
	WHERE e.ElectionID = @electionID
	ORDER BY v.VoteID ASC

END

GO


USE [reviewablevoting]
GO

/****** Object:  StoredProcedure [dbo].[GetStateResults]    Script Date: 5/1/2017 9:47:12 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Matthew Peterson
-- Create date: 5/1/17
-- Description:	Gets the results by state
-- =============================================
CREATE PROCEDURE [dbo].[GetStateResults]
	@electionID int = 0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	IF(@electionID < 1)
		THROW 50001, 'You must specify a non-negitive election', 1;

    -- Insert statements for procedure here
	SELECT COUNT(v.VoteID) as VoteCount, 
		c.CandidateID,
		zip.State, 
		CandidateName.CandidateName,
		p.PartyName
	FROM vote AS v
		INNER JOIN Candidates    AS c     ON c.CandidateID = v.CandidateID
		INNER JOIN Party         AS p     ON p.PartyID = c.PartyID
		--INNER JOIN Election      AS e     ON e.ElectionID = c.ElectionID
		INNER JOIN Voter         AS voter ON voter.VoterID = v.voterID
		INNER JOIN VoterAddress  AS va    ON va.VoterID = voter.VoterID
		INNER JOIN StreetAddress AS sa    ON sa.StreetAddressID = va.StreetAddressID
		INNER JOIN ZipCode       AS zip   ON zip.ZipCodeID = sa.ZipCodeID
		INNER JOIN (SELECT VoterID, FirstName + ' ' + LastName as CandidateName FROM Voter WHERE VoterID IN (SELECT CandidateID FROM Candidates)) as CandidateName ON CandidateName.VoterID = c.VoterID
	WHERE c.ElectionID = @electionID
	GROUP BY zip.State, c.CandidateID, p.PartyName, CandidateName.CandidateName
	ORDER BY State, VoteCount DESC

END

GO

