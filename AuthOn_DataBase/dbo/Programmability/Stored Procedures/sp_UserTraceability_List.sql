CREATE PROCEDURE [dbo].[sp_UserTraceability_List]
    @UserId BIGINT = NULL,
    @PerformedById BIGINT = NULL,
    @TypeActionId TINYINT = NULL,
    @PageIndex INT = NULL,
    @PageSize INT = NULL
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @TableTotalRecords TABLE (TotalRecords INT);
    DECLARE @TotalRecords INT;
    DECLARE @Offset INT;
    DECLARE @Limit INT;

    INSERT INTO @TableTotalRecords (TotalRecords) EXEC [dbo].[sp_UserTraceability_Count]
        @UserId = @UserId,
        @PerformedById = @PerformedById,
        @TypeActionId = @TypeActionId;

    SELECT @TotalRecords = TotalRecords FROM @TableTotalRecords;

    SELECT @Offset = Offset, 
           @Limit = Limit 
    FROM [dbo].[fn_PaginationData_Get](@PageIndex, @PageSize, @TotalRecords);

    SELECT *
    FROM [dbo].[UserTraceability]
    WHERE
        (@UserId IS NULL OR UserId = @UserId) AND
        (@PerformedById IS NULL OR PerformedById = @PerformedById) AND
        (@TypeActionId IS NULL OR TypeActionId = @TypeActionId)
    ORDER BY UserTraceabilityId
    OFFSET @Offset ROWS
    FETCH NEXT @Limit ROWS ONLY;
END