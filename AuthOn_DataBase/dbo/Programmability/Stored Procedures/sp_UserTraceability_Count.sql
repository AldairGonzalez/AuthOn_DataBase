CREATE PROCEDURE [dbo].[sp_UserTraceability_Count]
    @UserId        BIGINT  = NULL,
    @PerformedById BIGINT  = NULL,
    @TypeActionId  TINYINT = NULL,
    @FromDate       DATETIME2(0)  = NULL,
    @ToDate         DATETIME2(0)  = NULL
AS
BEGIN
    SET NOCOUNT ON;

    SELECT COUNT(*)
    FROM [dbo].[UserTraceability] WITH(NOLOCK)
    WHERE
        (@UserId IS NULL OR [UserId] = @UserId) AND
        (@PerformedById IS NULL OR [PerformedById] = @PerformedById) AND
        (@TypeActionId IS NULL OR [TypeActionId] = @TypeActionId) AND
        (@FromDate IS NULL OR [CreationRecordMoment] >= @FromDate) AND
        (@ToDate IS NULL OR [CreationRecordMoment] <= @ToDate);
END
GO