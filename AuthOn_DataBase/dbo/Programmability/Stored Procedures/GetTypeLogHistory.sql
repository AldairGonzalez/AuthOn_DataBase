CREATE PROCEDURE [dbo].[GetTypeLogHistory] (
	@typeLogHistoryId TINYINT = NULL,
	@code NVARCHAR(30) = NULL
)
AS
BEGIN
	SELECT
		*
	FROM [dbo].[TypeLogHistory]
	WHERE	(@typeLogHistoryId IS NULL OR TypeLogHistoryId = @typeLogHistoryId) AND
			(@code IS NULL OR Code = @code);
END