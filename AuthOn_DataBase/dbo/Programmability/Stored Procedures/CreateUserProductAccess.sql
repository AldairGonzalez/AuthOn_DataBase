CREATE PROCEDURE [dbo].[CreateUserProductAccess] (
	@productId BIGINT,
	@userId BIGINT
)
AS
BEGIN
	INSERT INTO [dbo].[UserProductAccess]
	(
		ProductId,
		UserId
	)
	VALUES
	(
		@productId,
		@userId
	)
	SELECT CAST(SCOPE_IDENTITY() AS BIGINT)
END