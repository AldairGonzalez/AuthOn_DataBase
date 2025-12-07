CREATE PROCEDURE [dbo].[sp_UserProductAccess_List]
    @ProductId BIGINT = NULL,
    @UserId    BIGINT = NULL,
    @IsActive  BIT    = NULL,
    @PageIndex INT    = NULL,
    @PageSize  INT    = NULL
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @TotalRecords INT
    DECLARE @CountResult TABLE (Total INT);
    
    INSERT INTO @CountResult EXEC [dbo].[sp_UserProductAccess_Count] 
        @ProductId, @UserId, @IsActive;
        
    SELECT @TotalRecords = Total FROM @CountResult;

    DECLARE @Offset INT, @Limit INT
    SELECT @Offset = Offset, @Limit = Limit 
    FROM [dbo].[fn_PaginationData_Get](@PageIndex, @PageSize, @TotalRecords);

    SELECT *
    FROM [dbo].[UserProductAccess] WITH(NOLOCK)
    WHERE
        (@ProductId IS NULL OR [ProductId] = @ProductId) AND
        (@UserId IS NULL OR [UserId] = @UserId) AND
        (@IsActive IS NULL OR [IsActive] = @IsActive)
    ORDER BY [UserProductAccessId] ASC
    OFFSET @Offset ROWS
    FETCH NEXT @Limit ROWS ONLY;
END
GO