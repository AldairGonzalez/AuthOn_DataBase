CREATE PROCEDURE [dbo].[CreateLogHistory] (
	@description NVARCHAR(MAX),
	@url NVARCHAR(1000),
	@typeLogHistoryId TINYINT,
	@userActionId BIGINT,
	@productId BIGINT = NULL
)
AS
BEGIN
	INSERT INTO [dbo].[LogHistory]
	(
		TypeLogHistoryId,
		UserActionId,
		[Description],
		[Url],
		ProductId
	)
	VALUES
	(
		@typeLogHistoryId,
		@userActionId,
		@description,
		@url,
		@productId
	)
	SELECT CAST(SCOPE_IDENTITY() AS BIGINT)
END