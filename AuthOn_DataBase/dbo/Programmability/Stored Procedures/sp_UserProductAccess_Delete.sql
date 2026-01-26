CREATE PROCEDURE [dbo].[sp_UserProductAccess_Delete]
    @UserProductAccessId BIGINT
AS
BEGIN
    DELETE FROM [dbo].[UserProductAccess]
    WHERE [UserProductAccessId] = @UserProductAccessId;
END
GO