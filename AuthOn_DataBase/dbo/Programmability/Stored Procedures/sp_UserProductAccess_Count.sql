CREATE PROCEDURE [dbo].[sp_UserProductAccess_Count]
    @ProductId BIGINT = NULL,
    @UserId    BIGINT = NULL,
    @IsActive  BIT    = NULL
AS
BEGIN
    SET NOCOUNT ON;

    SELECT COUNT(*)
    FROM [dbo].[UserProductAccess] WITH(NOLOCK)
    WHERE
        (@ProductId IS NULL OR [ProductId] = @ProductId) AND
        (@UserId IS NULL OR [UserId] = @UserId) AND
        (@IsActive IS NULL OR [IsActive] = @IsActive);
END
GO