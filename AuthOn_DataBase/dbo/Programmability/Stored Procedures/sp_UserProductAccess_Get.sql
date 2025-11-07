CREATE PROCEDURE [dbo].[sp_UserProductAccess_Get]
    @UserProductAccessId BIGINT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT *
    FROM [dbo].[UserProductAccess]
    WHERE UserProductAccessId = @UserProductAccessId;
END