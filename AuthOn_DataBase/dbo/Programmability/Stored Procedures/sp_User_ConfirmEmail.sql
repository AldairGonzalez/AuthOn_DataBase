CREATE PROCEDURE [dbo].[sp_User_ConfirmEmail]
    @UserId BIGINT
AS
BEGIN
    UPDATE [dbo].[User]
    SET 
        [EmailConfirmed] = 1,
        [UpdateRecordMoment] = SYSUTCDATETIME()
    WHERE [UserId] = @UserId;
END
GO