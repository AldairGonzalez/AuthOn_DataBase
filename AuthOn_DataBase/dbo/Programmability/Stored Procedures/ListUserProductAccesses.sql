CREATE PROCEDURE [dbo].[ListUserProductAccesses](
	@productId VARCHAR(MAX),
	@userId BIGINT = NULL,
	@isActive VARCHAR(10) = NULL,
	@pageIndex INT = NULL,
	@pageSize INT = NULL
)
AS
BEGIN
	DECLARE @tableIsActive TABLE (IsActive BIT);
	DECLARE @tableProduct TABLE (ProductId BIGINT);
	DECLARE @tableTotalRecords TABLE (TotalRecords INT)
	DECLARE @totalRecords INT
	DECLARE @offset INT
	DECLARE @limit INT

	INSERT INTO @tableTotalRecords (TotalRecords) EXEC [dbo].[GetNumberRecordsUserProductAccesses]
		@productId = @productId,
		@userId = @userId,
		@isActive = @isActive

	SELECT @totalRecords = TotalRecords FROM @tableTotalRecords

	SELECT	@offset = Offset, 
			@limit = Limit 
	FROM [dbo].[GetPaginationData] (@pageIndex, @pageSize, @totalRecords)

	INSERT INTO @tableIsActive
		SELECT * FROM [dbo].[SplitBit] (@isActive, ',')

	INSERT INTO @tableProduct 
		SELECT * FROM [dbo].[SplitBigInt] (@productId, ',')

	SELECT *
	FROM [dbo].[UserProductAccess]
	WHERE
		(@productId IS NULL OR ProductId IN (SELECT ProductId FROM @tableProduct)) AND
		(@userId IS NULL OR UserId = @userId) AND
		(@isActive IS NULL OR IsActive IN (SELECT IsActive FROM @tableIsActive))
	ORDER BY UserProductAccessId
	OFFSET @offset ROWS
	FETCH NEXT @limit ROWS ONLY
END