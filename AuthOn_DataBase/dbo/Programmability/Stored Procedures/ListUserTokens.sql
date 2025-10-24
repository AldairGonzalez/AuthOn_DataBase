CREATE PROCEDURE [dbo].[ListUserTokens](
	@tokenTypeId VARCHAR(10) = NULL,
	@isUsed VARCHAR(10) = NULL,
	@revoked VARCHAR(10) = NULL,
	@pageIndex INT = NULL,
	@pageSize INT = NULL
)
AS
BEGIN
	DECLARE @tableTokenType TABLE (TokenTypeId TINYINT);
	DECLARE @tableIsUsed TABLE (IsUsed BIT);
	DECLARE @tableRevoked TABLE (Revoked BIT);
	DECLARE @tableTotalRecords TABLE (TotalRecords INT)
	DECLARE @totalRecords INT
	DECLARE @offset INT
	DECLARE @limit INT

	INSERT INTO @tableTotalRecords (TotalRecords) EXEC [dbo].[GetNumberRecordsUserTokens]
		@tokenTypeId = @tokenTypeId,
		@isUsed = @isUsed,
		@revoked = @revoked

	SELECT @totalRecords = TotalRecords FROM @tableTotalRecords

	SELECT	@offset = Offset, 
			@limit = Limit 
	FROM [dbo].[GetPaginationData] (@pageIndex, @pageSize, @totalRecords)

	INSERT INTO @tableTokenType 
		SELECT * FROM [dbo].[SplitTinyInt] (@tokenTypeId, ',')

	INSERT INTO @tableIsUsed 
		SELECT * FROM [dbo].[SplitBit] (@isUsed, ',')

	INSERT INTO @tableRevoked
		SELECT * FROM [dbo].[SplitBit] (@revoked, ',')

	SELECT *
	FROM [dbo].[UserToken]
	WHERE
		(@tokenTypeId IS NULL OR TokenTypeId IN (SELECT TokenTypeId FROM @tableTokenType)) AND
		(@isUsed IS NULL OR IsUsed IN (SELECT IsUsed FROM @tableIsUsed)) AND
		(@revoked IS NULL OR Revoked IN (SELECT Revoked FROM @tableRevoked)) 
	ORDER BY UserTokenId
	OFFSET @offset ROWS
	FETCH NEXT @limit ROWS ONLY
END