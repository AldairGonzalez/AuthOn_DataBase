CREATE PROCEDURE [dbo].[sp_UserToken_Update]
    @UserTokenId       BIGINT,
    @Revoked           BIT,
    @ReplacedByTokenId BIGINT = NULL
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE [dbo].[UserToken]
    SET
        [Revoked]            = @Revoked,
        [ReplacedByTokenId]  = @ReplacedByTokenId,
        [UpdateRecordMoment] = SYSUTCDATETIME()
    WHERE [UserTokenId] = @UserTokenId;

    SELECT @@ROWCOUNT;
END
GO