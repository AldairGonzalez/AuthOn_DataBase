CREATE PROCEDURE [dbo].[sp_UserTraceability_List]
    @UserId        BIGINT  = NULL,
    @PerformedById BIGINT  = NULL,
    @TypeActionId  TINYINT = NULL,
    @FromDate      DATETIME2(0)  = NULL,
    @ToDate        DATETIME2(0)  = NULL,
    @PageIndex     INT     = NULL,
    @PageSize      INT     = NULL
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @TotalRecords INT
    DECLARE @CountResult TABLE (Total INT);
    
    INSERT INTO @CountResult EXEC [dbo].[sp_UserTraceability_Count] 
        @UserId, @PerformedById, @TypeActionId, @FromDate, @ToDate;
        
    SELECT @TotalRecords = Total FROM @CountResult;

    DECLARE @Offset INT, @Limit INT
    SELECT @Offset = Offset, @Limit = Limit 
    FROM [dbo].[fn_PaginationData_Get](@PageIndex, @PageSize, @TotalRecords);

    SELECT 
        [UserTraceabilityId],
        [UserId],
        [PerformedById],
        [TypeActionId],
        [IpAddress],
        [Observation],
        [CreationRecordMoment]
    FROM [dbo].[UserTraceability] WITH(NOLOCK)
    WHERE
        (@UserId IS NULL OR [UserId] = @UserId) AND
        (@PerformedById IS NULL OR [PerformedById] = @PerformedById) AND
        (@TypeActionId IS NULL OR [TypeActionId] = @TypeActionId) AND
        (@FromDate IS NULL OR [CreationRecordMoment] >= @FromDate) AND
        (@ToDate IS NULL OR [CreationRecordMoment] <= @ToDate)
    ORDER BY [UserTraceabilityId] DESC
    OFFSET @Offset ROWS
    FETCH NEXT @Limit ROWS ONLY;
END
GO