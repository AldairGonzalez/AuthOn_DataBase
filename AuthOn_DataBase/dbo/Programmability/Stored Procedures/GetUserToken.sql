CREATE PROCEDURE [dbo].[GetUserToken] (
	@userTokenId BIGINT
)
AS
BEGIN
	SELECT
		*
	FROM [dbo].[UserToken]
	WHERE	UserTokenId = @userTokenId
END