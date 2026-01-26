CREATE PROCEDURE [dbo].[sp_UserToken_Delete]
    @UserTokenId BIGINT
AS
BEGIN
    DELETE FROM [dbo].[UserToken]
    WHERE [UserTokenId] = @UserTokenId;
END
GO