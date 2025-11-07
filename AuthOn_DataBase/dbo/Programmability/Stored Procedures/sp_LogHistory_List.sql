CREATE PROCEDURE [dbo].[sp_LogHistory_List]
    @TypeLogHistoryId TINYINT = NULL,
    @UserActionId BIGINT = NULL,
    @ProductId BIGINT = NULL
AS
BEGIN
    SET NOCOUNT ON;

    SELECT *
    FROM [dbo].[LogHistory]
    WHERE
        (@TypeLogHistoryId IS NULL OR TypeLogHistoryId = @TypeLogHistoryId) AND
        (@UserActionId IS NULL OR UserActionId = @UserActionId) AND
        (@ProductId IS NULL OR ProductId = @ProductId)
    ORDER BY LogHistoryId;
END