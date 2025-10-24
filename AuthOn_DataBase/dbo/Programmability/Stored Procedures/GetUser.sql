CREATE PROCEDURE [dbo].[GetUser] (
	@userId BIGINT = NULL,
	@email NVARCHAR(255) = NULL
)
AS
BEGIN
	SELECT
		*
	FROM [dbo].[User]
	WHERE	(@userId IS NULL OR UserId = @userId) AND
			(@email IS NULL OR Email = @email)
END