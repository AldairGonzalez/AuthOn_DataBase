CREATE PROCEDURE [dbo].[sp_Email_GetPendingToSend]
    @MaxRetries TINYINT = 3,
    @BatchSize  INT = 50
AS
BEGIN
    SET NOCOUNT ON;

    SELECT TOP (@BatchSize)
        [EmailId],
        [Subject],
        [Recipients],
        [Body],
        [SendingAttempts]
    FROM [dbo].[Email] WITH(NOLOCK)
    WHERE 
        ([EmailStatusId] = 1) 
        OR 
        ([EmailStatusId] = 3 AND [SendingAttempts] < @MaxRetries)
    ORDER BY [SendingAttempts] ASC, [CreationRecordMoment] ASC;
END
GO