CREATE PROCEDURE [dbo].[GetLanguage] (
	@languageId TINYINT = NULL,
	@initials NVARCHAR(20) = NULL
)
AS
BEGIN
	SELECT
		*
	FROM [dbo].[Language]
	WHERE	(@languageId IS NULL OR LanguageId = @languageId) AND
			(@initials IS NULL OR Initials = @initials)
END