CREATE PROCEDURE [dbo].[sp_User_ChangePassword]
    @UserId                     BIGINT,
    @PasswordHash               VARCHAR(255),
    @ChangePasswordOnNextSignIn BIT = 0
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE [dbo].[User]
    SET
        [PasswordHash]               = @PasswordHash,
        [ChangePasswordOnNextSignIn] = @ChangePasswordOnNextSignIn,
        [AuthenticationAttempts]     = 0, 
        [UpdateRecordMoment]         = SYSUTCDATETIME()
    WHERE [UserId] = @UserId;

    SELECT @@ROWCOUNT;
END
GO