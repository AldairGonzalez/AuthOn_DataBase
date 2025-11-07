CREATE PROCEDURE [dbo].[sp_Email_Update]
    @EmailId BIGINT,
    @EmailStatusId BIGINT,
    @Seen BIT,
    @UpdateRecordMoment DATETIME2
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE [dbo].[Email]
    SET
        EmailStatusId = @EmailStatusId,
        Seen = @Seen,
        UpdateRecordMoment = @UpdateRecordMoment
    WHERE EmailId = @EmailId;

    SELECT @@ROWCOUNT;
END