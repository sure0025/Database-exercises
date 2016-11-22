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
CREATE PROCEDURE InsertPet 
	-- Add the parameters for the stored procedure here
	@PetName Nvarchar,
	@PetType Nvarchar,
	@PetBreed Nvarchar, 
	@PetDOB date,
	@PetWeight float,
	@OwnerID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	

	SELECT @PetName, @PetType, @PetBreed, @PetDOB, @PetWeight, @OwnerID
	FROM Pet
	WHERE PetName = @PetName AND PetType = @PetType AND PetBreed = @PetBreed AND PetDOB = @PetDOB AND PetWeight = @PetWeight AND OwnerID = @OwnerID
END
GO
ALTER PROCEDURE InsertPet(@PetID int,
	@PetName varchar(100),
	@PetType varchar(100),
	@PetBreed varchar(100), 
	@PetDOB varchar(100),
	@PetWeight float,
	@OwnerID int) AS
BEGIN
INSERT INTO Pet(PetID, PetName, PetType, PetBreed, PetDOB, PetWeight, OwnerID) VALUES
	(@PetID, @PetName, @PetType, @PetBreed, @PetDOB, @PetWeight, @OwnerID)
END
