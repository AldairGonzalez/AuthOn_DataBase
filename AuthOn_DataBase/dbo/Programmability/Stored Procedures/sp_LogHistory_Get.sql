CREATE PROCEDURE [dbo].[sp_LogHistory_Get]
    @LogHistoryId BIGINT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        [LogHistoryId],
		[TypeLogHistoryId],
		[UserActionId],
		[Description],
		[Url],
		[ProductId],
		[CreationRecordMoment]
    FROM [dbo].[LogHistory] WITH(NOLOCK)
    WHERE LogHistoryId = @LogHistoryId;
END
GO