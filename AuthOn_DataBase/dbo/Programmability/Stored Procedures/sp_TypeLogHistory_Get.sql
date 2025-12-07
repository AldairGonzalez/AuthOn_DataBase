CREATE PROCEDURE [dbo].[sp_TypeLogHistory_Get]
    @TypeLogHistoryId TINYINT     = NULL,
    @Code             VARCHAR(50) = NULL
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        [TypeLogHistoryId],
        [Code]
    FROM [dbo].[TypeLogHistory] WITH(NOLOCK)
    WHERE 
        (@TypeLogHistoryId IS NULL OR [TypeLogHistoryId] = @TypeLogHistoryId) AND
        (@Code IS NULL OR [Code] = @Code);
END
GO