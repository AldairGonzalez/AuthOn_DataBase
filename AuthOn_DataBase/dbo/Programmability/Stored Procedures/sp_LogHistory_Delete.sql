CREATE PROCEDURE [dbo].[sp_LogHistory_Delete]
    @LogHistoryId BIGINT
AS
BEGIN
    SET NOCOUNT ON;

    DELETE FROM [dbo].[LogHistory]
    WHERE LogHistoryId = @LogHistoryId;

    SELECT @@ROWCOUNT;
END
GO