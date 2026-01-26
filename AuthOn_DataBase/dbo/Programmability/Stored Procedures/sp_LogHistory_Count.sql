CREATE PROCEDURE [dbo].[sp_LogHistory_Count]
    @TypeLogHistoryId TINYINT = NULL,
    @UserActionId     BIGINT  = NULL,
    @ProductId        BIGINT  = NULL,
    @FromDate         DATETIME2(0)  = NULL,
    @ToDate           DATETIME2(0)  = NULL,
    @SearchText       NVARCHAR(100) = NULL
AS
BEGIN
    SET NOCOUNT ON;

    SELECT COUNT(*)
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
END
GO