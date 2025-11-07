CREATE PROCEDURE [dbo].[sp_UserToken_Delete]
    @UserTokenId BIGINT
AS
BEGIN
    SET NOCOUNT ON;

    DELETE FROM [dbo].[UserToken]
    WHERE UserTokenId = @UserTokenId;

    SELECT CAST(CASE WHEN @@ROWCOUNT > 0 THEN 1 ELSE 0 END AS BIT);
END