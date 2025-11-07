CREATE PROCEDURE [dbo].[sp_UserToken_Update]
    @UserTokenId BIGINT,
    @IsUsed BIT,
    @Revoked BIT,
    @UpdateRecordMoment DATETIME2
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE [dbo].[UserToken]
    SET
        IsUsed = @IsUsed,
        Revoked = @Revoked,
        UpdateRecordMoment = @UpdateRecordMoment
    WHERE UserTokenId = @UserTokenId;

    SELECT @@ROWCOUNT;
END