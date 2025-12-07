CREATE PROCEDURE [dbo].[sp_UserProductAccess_Delete]
    @UserProductAccessId BIGINT
AS
BEGIN
    SET NOCOUNT ON;

    DELETE FROM [dbo].[UserProductAccess]
    WHERE [UserProductAccessId] = @UserProductAccessId;

    SELECT @@ROWCOUNT;
END
GO