CREATE PROCEDURE [dbo].[sp_UserToken_Get]
    @UserTokenId BIGINT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT *
    FROM [dbo].[UserToken]
    WHERE UserTokenId = @UserTokenId;
END