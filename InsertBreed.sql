-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Name
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE InsertBreed 
	-- Add the parameters for the stored procedure here
	@BreedName varchar(100),
	@MinWeight float,
	@MaxWeight float,
	@AverageLifeExpectancy int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT @BreedName, @MinWeight, @MaxWeight, @AverageLifeExpectancy
	FROM Breed
	WHERE BreedName = @BreedName AND MinWeight = @MinWeight AND MaxWeight = @MaxWeight AND AverageLifeExpectancy = @AverageLifeExpectancy
END
GO

ALTER PROCEDURE InsertBreed
(
	@BreedName varchar(100),
	@MinWeight float,
	@MaxWeight float,
	@AverageLifeExpectancy int) AS 
Begin
 
INSERT INTO Breed (BreedName, MinWeight, MaxWeight, AverageLifeExpectancy)
VALUES
 (@BreedName, @MinWeight, @MaxWeight, @AverageLifeExpectancy)

 END