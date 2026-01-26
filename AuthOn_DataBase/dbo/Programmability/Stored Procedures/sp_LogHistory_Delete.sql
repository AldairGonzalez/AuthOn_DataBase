CREATE PROCEDURE [dbo].[sp_LogHistory_Delete]
    @LogHistoryId BIGINT
AS
BEGIN
    DELETE FROM [dbo].[LogHistory]
    WHERE LogHistoryId = @LogHistoryId;
END
GO