CREATE PROCEDURE [dbo].[sp_User_Update_SecuritySettings]
    @UserId                     BIGINT,
    @TwoFactorEnabled           BIT,
    @ChangePasswordOnNextSignIn BIT
AS
BEGIN
    UPDATE [dbo].[User]
    SET 
        [TwoFactorEnabled] = @TwoFactorEnabled,
        [ChangePasswordOnNextSignIn] = @ChangePasswordOnNextSignIn,
        [UpdateRecordMoment] = SYSUTCDATETIME()
    WHERE [UserId] = @UserId;
END
GO