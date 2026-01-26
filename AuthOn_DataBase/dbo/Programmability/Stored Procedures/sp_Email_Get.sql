CREATE PROCEDURE [dbo].[sp_Email_Get]
    @EmailId BIGINT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        [EmailId],
        [Subject],
        [Recipients],
        [Body],
        [EmailStatusId],
        [Seen],
        [SendingAttempts],
        [CreationRecordMoment],
        [UpdateRecordMoment]
    FROM [dbo].[Email]
    WHERE EmailId = @EmailId;
END
GO