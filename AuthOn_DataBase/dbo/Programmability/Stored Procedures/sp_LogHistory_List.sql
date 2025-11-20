CREATE PROCEDURE [dbo].[sp_LogHistory_List]
    @TypeLogHistoryId TINYINT = NULL,
    @UserActionId BIGINT = NULL,
    @ProductId BIGINT = NULL,
    @PageIndex INT = NULL,
    @PageSize INT = NULL
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @TableTotalRecords TABLE (TotalRecords INT)
    DECLARE @TotalRecords INT
    DECLARE @Offset INT
    DECLARE @Limit INT

    INSERT INTO @TableTotalRecords (TotalRecords) EXEC [dbo].[sp_LogHistory_Count]
        @TypeLogHistoryId = @TypeLogHistoryId,
        @UserActionId = @UserActionId,
        @ProductId = @ProductId

    SELECT @TotalRecords = TotalRecords FROM @TableTotalRecords

    SELECT @Offset = Offset, 
           @Limit = Limit 
    FROM [dbo].[fn_PaginationData_Get](@PageIndex, @PageSize, @TotalRecords)

    SELECT *
    FROM [dbo].[LogHistory]
	WHERE
        (@TypeLogHistoryId IS NULL OR TypeLogHistoryId = @TypeLogHistoryId) AND
        (@UserActionId IS NULL OR UserActionId = @UserActionId) AND
        (@ProductId IS NULL OR ProductId = @ProductId)
    ORDER BY LogHistoryId
    OFFSET @Offset ROWS
    FETCH NEXT @Limit ROWS ONLY
END