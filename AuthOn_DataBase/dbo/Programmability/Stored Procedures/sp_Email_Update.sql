CREATE PROCEDURE [dbo].[sp_Email_Update]
    @EmailId       BIGINT,
    @EmailStatusId TINYINT,
    @Seen          BIT
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE [dbo].[Email]
    SET
        [EmailStatusId]      = @EmailStatusId,
        [Seen]               = @Seen,
        [UpdateRecordMoment] = SYSUTCDATETIME()
    WHERE [EmailId] = @EmailId;

    SELECT @@ROWCOUNT;
END
GO