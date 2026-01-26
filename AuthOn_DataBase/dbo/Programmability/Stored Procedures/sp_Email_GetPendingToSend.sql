CREATE PROCEDURE [dbo].[sp_Email_GetPendingToSend]
    @PendingEmailStatusId TINYINT,
    @FailedEmailStatusId TINYINT,
    @MaxRetries TINYINT,
    @BatchSize  INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT TOP (@BatchSize)
        [EmailId],
        [Subject],
        [Recipients],
        [Body],
        [EmailStatusId],
        [Seen],
        [SendingAttempts],
        [CreationRecordMoment],
        [UpdateRecordMoment]
    FROM [dbo].[Email] WITH(NOLOCK)
    WHERE 
    (
        [EmailStatusId] = @PendingEmailStatusId
        OR 
        ([EmailStatusId] = @FailedEmailStatusId AND [SendingAttempts] < @MaxRetries)
    )
    AND [Seen] = 0
    ORDER BY [SendingAttempts] ASC, [CreationRecordMoment] ASC;
END
GO