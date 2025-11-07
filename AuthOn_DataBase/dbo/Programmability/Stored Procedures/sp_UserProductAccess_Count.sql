CREATE PROCEDURE [dbo].[sp_UserProductAccess_Count]
    @ProductId VARCHAR(MAX) = NULL,
    @UserId BIGINT = NULL,
    @IsActive BIT = NULL
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @TableProduct TABLE (ProductId BIGINT);

    IF @ProductId IS NOT NULL
        INSERT INTO @TableProduct 
        SELECT * FROM [dbo].[fn_SplitBigInt](@ProductId, ',');

    SELECT COUNT(*)
    FROM [dbo].[UserProductAccess]
    WHERE
        (@ProductId IS NULL OR ProductId IN (SELECT ProductId FROM @TableProduct)) AND
        (@UserId IS NULL OR UserId = @UserId) AND
        (@IsActive IS NULL OR IsActive = @IsActive);
END