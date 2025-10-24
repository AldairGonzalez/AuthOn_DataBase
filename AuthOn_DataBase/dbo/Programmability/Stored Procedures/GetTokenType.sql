CREATE PROCEDURE [dbo].[GetTokenType] (
	@tokenTypeId TINYINT = NULL,
	@code NVARCHAR(30) = NULL
)
AS
BEGIN
	SELECT
		*
	FROM [dbo].[TokenType]
	WHERE	(@tokenTypeId IS NULL OR TokenTypeId = @tokenTypeId) AND
			(@code IS NULL OR Code = @code);
END