CREATE PROCEDURE [dbo].[sp_UserProductAccess_Check]
    @UserId    BIGINT,
    @ProductId BIGINT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT TOP 1 1
    FROM [dbo].[UserProductAccess] WITH(NOLOCK)
    WHERE [UserId] = @UserId 
      AND [ProductId] = @ProductId 
      AND [IsActive] = 1;
END