CREATE PROCEDURE [dbo].[sp_UserVerification_Update_Attempts]
    @UserId         BIGINT
AS
BEGIN
    UPDATE [dbo].[UserVerification]
    SET [FailedAttempts] = [FailedAttempts] + 1
    WHERE [UserId] = @UserId;
END
GO