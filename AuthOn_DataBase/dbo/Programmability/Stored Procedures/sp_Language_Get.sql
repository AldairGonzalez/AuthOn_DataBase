CREATE PROCEDURE [dbo].[sp_Language_Get]
	@LanguageId TINYINT = NULL,
	@Code NVARCHAR(30) = NULL
AS
BEGIN
	SET NOCOUNT ON;

	SELECT
		*
	FROM [dbo].[Language]
	WHERE	(@LanguageId IS NULL OR LanguageId = @LanguageId) AND
			(@Code IS NULL OR Code = @Code)
END