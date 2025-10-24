CREATE PROCEDURE [dbo].[ListLogHistories] (
	@description NVARCHAR(MAX),
	@url NVARCHAR(1000),
	@typeLogHistoryId TINYINT = NULL,
	@userActionId BIGINT = NULL,
	@productId BIGINT = NULL
)
AS
BEGIN
	SELECT
		*
	FROM [dbo].[LogHistory]
	WHERE	[Description] LIKE '%' + @description + '%' AND
			[Url] LIKE '%' + @url + '%' AND
			(@typeLogHistoryId IS NULL OR TypeLogHistoryId = @typeLogHistoryId) AND
			(@userActionId IS NULL OR UserActionId = @userActionId) AND
			(@productId IS NULL OR ProductId = @productId)
END