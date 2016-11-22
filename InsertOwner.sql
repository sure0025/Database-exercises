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
CREATE PROCEDURE InsertOwner 
	-- Add the parameters for the stored procedure here
	@OwnerID int,
	@OwnerLastName varchar(100),
	@OwnerFirstName varchar(100),
	@OwnerPhone float,
	@OwnerEmail varchar(100)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT @OwnerID, @OwnerLastName, @OwnerFirstName, @OwnerPhone, @OwnerEmail
	FROM Pet_Owner
	WHERE OwnerID = @OwnerID AND OwnerLastName = @OwnerLastName AND OwnerPhone = @OwnerPhone AND OwnerEmail = @OwnerEmail 
END
GO
ALTER PROCEDURE InsertOwner
(	@OwnerID int,
	@OwnerLastName varchar(100),
	@OwnerFirstName varchar(100),
	@OwnerPhone float,
	@OwnerEmail varchar(100)) AS
BEGIN
INSERT INTO Pet_Owner(OwnerID, OwnerLastName, OwnerFirstName, OwnerPhone, OwnerEmail)
VALUES
	(@OwnerID, @OwnerLastName, @OwnerFirstName, @OwnerPhone, @OwnerEmail)
END
