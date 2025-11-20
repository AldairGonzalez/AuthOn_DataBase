CREATE PROCEDURE [dbo].[sp_LogHistory_Delete]
    @LogHistoryId BIGINT
AS
BEGIN
    SET NOCOUNT ON;

    DELETE FROM [dbo].[LogHistory]
    WHERE LogHistoryId = @LogHistoryId;

    SELECT CAST(CASE WHEN @@ROWCOUNT > 0 THEN 1 ELSE 0 END AS BIT);
END
