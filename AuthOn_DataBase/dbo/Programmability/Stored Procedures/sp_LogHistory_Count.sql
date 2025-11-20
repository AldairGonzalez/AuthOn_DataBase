CREATE PROCEDURE [dbo].[sp_LogHistory_Count]
    @TypeLogHistoryId TINYINT = NULL,
    @UserActionId BIGINT = NULL,
    @ProductId BIGINT = NULL
AS
BEGIN
	SET NOCOUNT ON;

	SELECT COUNT(*)
	FROM [dbo].[LogHistory]
	WHERE
        (@TypeLogHistoryId IS NULL OR TypeLogHistoryId = @TypeLogHistoryId) AND
        (@UserActionId IS NULL OR UserActionId = @UserActionId) AND
        (@ProductId IS NULL OR ProductId = @ProductId);
END
