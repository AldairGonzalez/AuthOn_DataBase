CREATE PROCEDURE [dbo].[sp_TypeLogHistory_Get]
    @TypeLogHistoryId TINYINT     = NULL,
    @Code             VARCHAR(50) = NULL
AS
BEGIN
    SET NOCOUNT ON;

    IF @TypeLogHistoryId IS NULL AND @Code IS NULL
    BEGIN
        RETURN;
    END

    SELECT TOP 1
        [TypeLogHistoryId],
        [Code]
    FROM [dbo].[TypeLogHistory] WITH(NOLOCK)
    WHERE 
        (@TypeLogHistoryId IS NOT NULL AND [TypeLogHistoryId] = @TypeLogHistoryId)
        OR
        (@Code IS NOT NULL AND [Code] = @Code);
END
GO