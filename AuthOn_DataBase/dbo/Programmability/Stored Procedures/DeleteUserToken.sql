CREATE PROCEDURE [dbo].[DeleteUserToken] (
	@userTokenId BIGINT	
)
AS
BEGIN
	DELETE FROM 
		[dbo].[UserToken]
	WHERE 
		UserTokenId = @userTokenId
END