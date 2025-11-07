CREATE PROCEDURE [dbo].[sp_UserProductAccess_List]
    @ProductId VARCHAR(MAX) = NULL,
    @UserId BIGINT = NULL,
    @IsActive BIT = NULL,
    @PageIndex INT = NULL,
    @PageSize INT = NULL
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @TableProduct TABLE (ProductId BIGINT);
    DECLARE @TableTotalRecords TABLE (TotalRecords INT);
    DECLARE @TotalRecords INT;
    DECLARE @Offset INT;
    DECLARE @Limit INT;

    IF @ProductId IS NOT NULL
        INSERT INTO @TableProduct 
        SELECT * FROM [dbo].[fn_SplitBigInt](@ProductId, ',');

    INSERT INTO @TableTotalRecords (TotalRecords) EXEC [dbo].[sp_UserProductAccess_Count]
        @ProductId = @ProductId,
        @UserId = @UserId,
        @IsActive = @IsActive;

    SELECT @TotalRecords = TotalRecords FROM @TableTotalRecords;

    SELECT @Offset = Offset, 
           @Limit = Limit 
    FROM [dbo].[fn_PaginationData_Get](@PageIndex, @PageSize, @TotalRecords);

    SELECT *
    FROM [dbo].[UserProductAccess]
    WHERE
        (@ProductId IS NULL OR ProductId IN (SELECT ProductId FROM @TableProduct)) AND
        (@UserId IS NULL OR UserId = @UserId) AND
        (@IsActive IS NULL OR IsActive = @IsActive)
    ORDER BY UserProductAccessId
    OFFSET @Offset ROWS
    FETCH NEXT @Limit ROWS ONLY;
END