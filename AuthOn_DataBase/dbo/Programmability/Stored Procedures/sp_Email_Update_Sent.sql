CREATE PROCEDURE [dbo].[sp_Email_Update_Sent]
    @EmailId       BIGINT,
    @SentEmailStatusId TINYINT
AS
BEGIN
    UPDATE [dbo].[Email]
    SET
        [EmailStatusId]      = @SentEmailStatusId,
        [UpdateRecordMoment] = SYSUTCDATETIME()
    WHERE [EmailId] = @EmailId;
END
GO