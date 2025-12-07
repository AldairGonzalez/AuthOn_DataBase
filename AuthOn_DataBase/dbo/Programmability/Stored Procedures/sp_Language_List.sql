CREATE PROCEDURE [dbo].[sp_Language_List]
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
        [LanguageId],
        [Code]
    FROM [dbo].[Language] WITH(NOLOCK)
    ORDER BY [LanguageId] ASC;
END
GO