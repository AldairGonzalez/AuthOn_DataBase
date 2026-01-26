CREATE PROCEDURE [dbo].[sp_Email_Update_Seen]
    @EmailId       BIGINT
AS
BEGIN
    UPDATE [dbo].[Email]
    SET
        [Seen] = 1,
        [UpdateRecordMoment] = SYSUTCDATETIME()
    WHERE [EmailId] = @EmailId;
END
GO