CREATE PROCEDURE [dbo].[GetNumberRecordsUserProductAccesses](
	@productId VARCHAR(MAX),
	@userId BIGINT = NULL,
	@isActive VARCHAR(10) = NULL
)
AS
BEGIN
	DECLARE @tableIsActive TABLE (IsActive BIT);
	DECLARE @tableProduct TABLE (ProductId BIGINT);

	INSERT INTO @tableIsActive
		SELECT * FROM [dbo].[SplitBit] (@isActive, ',')

	INSERT INTO @tableProduct 
		SELECT * FROM [dbo].[SplitBigInt] (@productId, ',')

	SELECT COUNT(*)
	FROM [dbo].[UserProductAccess]
	WHERE
		(@productId IS NULL OR ProductId IN (SELECT ProductId FROM @tableProduct)) AND
		(@userId IS NULL OR UserId = @userId) AND
		(@isActive IS NULL OR IsActive IN (SELECT IsActive FROM @tableIsActive))
END