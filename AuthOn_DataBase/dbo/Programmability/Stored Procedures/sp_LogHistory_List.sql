CREATE PROCEDURE [dbo].[sp_LogHistory_List]
    @TypeLogHistoryId TINYINT = NULL,
    @UserActionId     BIGINT  = NULL,
    @ProductId        BIGINT  = NULL,
    @FromDate         DATETIME2(0)  = NULL,
    @ToDate           DATETIME2(0)  = NULL,
    @SearchText       NVARCHAR(100) = NULL,
    @PageIndex        INT     = NULL,
    @PageSize         INT     = NULL
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @TotalRecords INT
    
    DECLARE @CountResult TABLE (Total INT);
    INSERT INTO @CountResult EXEC [dbo].[sp_LogHistory_Count] 
        @TypeLogHistoryId, @UserActionId, @ProductId, @FromDate, @ToDate, @SearchText;
        
    SELECT @TotalRecords = Total FROM @CountResult;

    DECLARE @Offset INT, @Limit INT
    SELECT @Offset = Offset, @Limit = Limit 
    FROM [dbo].[fn_PaginationData_Get](@PageIndex, @PageSize, @TotalRecords)

    SELECT 
        [LogHistoryId],
		[TypeLogHistoryId],
		[UserActionId],
		[Description],
		[Url],
		[ProductId],
		[CreationRecordMoment]
    FROM [dbo].[LogHistory] WITH(NOLOCK)
    WHERE
        (@TypeLogHistoryId IS NULL OR [TypeLogHistoryId] = @TypeLogHistoryId) AND
        (@UserActionId IS NULL OR [UserActionId] = @UserActionId) AND
        (@ProductId IS NULL OR [ProductId] = @ProductId) AND
        (@FromDate IS NULL OR [CreationRecordMoment] >= @FromDate) AND
        (@ToDate IS NULL OR [CreationRecordMoment] <= @ToDate) AND
        (@SearchText IS NULL OR 
             [Description] LIKE '%' + @SearchText + '%' OR 
             [Url] LIKE '%' + @SearchText + '%')
    ORDER BY [CreationRecordMoment] DESC 
    OFFSET @Offset ROWS
    FETCH NEXT @Limit ROWS ONLY
END
GO