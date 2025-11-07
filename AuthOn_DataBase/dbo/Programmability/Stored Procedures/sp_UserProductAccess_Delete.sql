CREATE PROCEDURE [dbo].[sp_UserProductAccess_Delete]
    @UserProductAccessId BIGINT
AS
BEGIN
    SET NOCOUNT ON;

    DELETE FROM [dbo].[UserProductAccess]
    WHERE UserProductAccessId = @UserProductAccessId;

    SELECT CAST(CASE WHEN @@ROWCOUNT > 0 THEN 1 ELSE 0 END AS BIT);
END