CREATE PROCEDURE [dbo].[sp_User_Update_AuthenticationAttempts]
    @UserId                 BIGINT,
    @AuthenticationAttempts TINYINT
AS
BEGIN
    UPDATE [dbo].[User]
    SET 
        [AuthenticationAttempts] = @AuthenticationAttempts,
        [UpdateRecordMoment]     = SYSUTCDATETIME()
    WHERE [UserId] = @UserId;
END
GO