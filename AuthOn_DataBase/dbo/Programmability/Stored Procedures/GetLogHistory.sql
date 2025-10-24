CREATE PROCEDURE [dbo].[GetLogHistory] (
	@logHistoryId BIGINT
)
AS
BEGIN
	SELECT
		*
	FROM [dbo].[LogHistory]
	WHERE	LogHistoryId = @logHistoryId
END