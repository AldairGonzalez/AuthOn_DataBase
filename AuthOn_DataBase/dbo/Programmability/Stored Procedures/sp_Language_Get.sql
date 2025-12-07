CREATE PROCEDURE [dbo].[sp_Language_Get]
    @LanguageId TINYINT     = NULL,
    @Code       VARCHAR(50) = NULL
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
        [LanguageId],
        [Code]
    FROM [dbo].[Language] WITH(NOLOCK)
    WHERE 
        (@LanguageId IS NULL OR [LanguageId] = @LanguageId) AND
        (@Code IS NULL OR [Code] = @Code);
END
GO