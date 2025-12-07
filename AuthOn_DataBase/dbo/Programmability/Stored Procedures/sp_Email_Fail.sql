CREATE PROCEDURE [dbo].[sp_Email_Fail]
    @EmailId BIGINT
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE [dbo].[Email]
    SET 
        [EmailStatusId] = 3,
        [SendingAttempts] = [SendingAttempts] + 1,
        [UpdateRecordMoment] = SYSUTCDATETIME()
    WHERE [EmailId] = @EmailId;
END
GO