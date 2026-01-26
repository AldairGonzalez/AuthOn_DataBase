CREATE PROCEDURE [dbo].[sp_UserToken_Update_Rotate]
    @UserTokenId       BIGINT,
    @ReplacedByTokenId BIGINT
AS
BEGIN
    UPDATE [dbo].[UserToken]
    SET 
        [Revoked] = 1,
        [ReplacedByTokenId] = @ReplacedByTokenId,
        [UpdateRecordMoment] = SYSUTCDATETIME()
    WHERE [UserTokenId] = @UserTokenId;
END
GO