CREATE PROCEDURE [dbo].[DeleteUser] (
	@userId BIGINT	
)
AS
BEGIN
	DELETE FROM 
		[dbo].[User]
	WHERE 
		UserId = @userId
END