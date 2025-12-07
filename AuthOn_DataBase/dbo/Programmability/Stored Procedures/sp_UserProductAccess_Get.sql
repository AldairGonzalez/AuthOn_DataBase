CREATE PROCEDURE [dbo].[sp_UserProductAccess_Get]
    @UserProductAccessId BIGINT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT *
    FROM [dbo].[UserProductAccess] WITH(NOLOCK)
    WHERE [UserProductAccessId] = @UserProductAccessId;
END
GO