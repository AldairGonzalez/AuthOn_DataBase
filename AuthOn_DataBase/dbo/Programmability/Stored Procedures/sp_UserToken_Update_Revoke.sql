CREATE PROCEDURE [dbo].[sp_UserToken_Update_Revoke]
    @UserTokenId BIGINT
AS
BEGIN
    UPDATE [dbo].[UserToken]
    SET 
        [Revoked] = 1,
        [UpdateRecordMoment] = SYSUTCDATETIME()
    WHERE [UserTokenId] = @UserTokenId;
END
GO