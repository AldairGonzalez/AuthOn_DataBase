CREATE PROCEDURE [dbo].[sp_Language_Get]
    @LanguageId TINYINT     = NULL,
    @Code       VARCHAR(50) = NULL
AS
BEGIN
    SET NOCOUNT ON;

    IF @LanguageId IS NULL AND @Code IS NULL
    BEGIN
        RETURN;
    END

    SELECT TOP 1
        [LanguageId],
        [Code]
    FROM [dbo].[Language] WITH(NOLOCK)
    WHERE 
        (@LanguageId IS NOT NULL AND [LanguageId] = @LanguageId)
        OR
        (@Code IS NOT NULL AND [Code] = @Code);
END
GO