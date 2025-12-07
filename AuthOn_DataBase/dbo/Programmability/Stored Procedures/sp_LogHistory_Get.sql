CREATE PROCEDURE [dbo].[sp_LogHistory_Get]
    @LogHistoryId BIGINT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT *
    FROM [dbo].[LogHistory] WITH(NOLOCK)
    WHERE LogHistoryId = @LogHistoryId;
END
GO