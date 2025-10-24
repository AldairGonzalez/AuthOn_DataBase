CREATE PROCEDURE [dbo].[DeleteEmail] (
	@emailId BIGINT	
)
AS
BEGIN
	DELETE FROM 
		[dbo].[Email]
	WHERE 
		EmailId = @emailId
END