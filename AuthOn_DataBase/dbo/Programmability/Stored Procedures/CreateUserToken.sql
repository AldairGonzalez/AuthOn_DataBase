CREATE PROCEDURE [dbo].[CreateUserToken] (
	@userId BIGINT,
	@tokenTypeId TINYINT,
	@token NVARCHAR(MAX)
)
AS
BEGIN
	INSERT INTO [dbo].[UserToken]
	(
		UserId,
		TokenTypeId,
		Token
	)
	VALUES
	(
		@userId,
		@tokenTypeId,
		@token
	)
	SELECT CAST(SCOPE_IDENTITY() AS BIGINT)
END