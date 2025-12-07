CREATE PROCEDURE [dbo].[sp_UserToken_Delete]
    @UserTokenId BIGINT
AS
BEGIN
    SET NOCOUNT ON;

    DELETE FROM [dbo].[UserToken]
    WHERE [UserTokenId] = @UserTokenId;

    SELECT @@ROWCOUNT;
END
GO