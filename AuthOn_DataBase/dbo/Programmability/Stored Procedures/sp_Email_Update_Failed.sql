CREATE PROCEDURE [dbo].[sp_Email_Update_Failed]
    @EmailId BIGINT,
    @FailedEmailStatusId TINYINT
AS
BEGIN
    UPDATE [dbo].[Email]
    SET 
        [EmailStatusId] = @FailedEmailStatusId,
        [SendingAttempts] = [SendingAttempts] + 1,
        [UpdateRecordMoment] = SYSUTCDATETIME()
    WHERE [EmailId] = @EmailId;
END
GO