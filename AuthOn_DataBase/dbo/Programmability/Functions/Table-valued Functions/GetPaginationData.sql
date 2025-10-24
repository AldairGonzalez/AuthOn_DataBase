CREATE FUNCTION [dbo].[GetPaginationData] (
	@pageIndex INT = NULL,
	@pageSize INT = NULL,
	@totalRecords INT
)
RETURNS @result TABLE (
	Offset INT NOT NULL,
	Limit INT NOT NULL
)
AS
BEGIN
	DECLARE @offset INT;
	DECLARE @limit INT;
	SET @offset =
	CASE 
		WHEN @pageIndex IS NOT NULL AND @pageSize IS NOT NULL
		THEN (@pageIndex - 1) * @pageSize
		ELSE 0
	END
	SET @limit =
	CASE
		WHEN @pageIndex IS NOT NULL AND @pageSize IS NOT NULL 
		THEN @pageSize
		ELSE IIF(@totalRecords = 0, 1, @totalRecords)
	END
	INSERT INTO @result (Offset, Limit) VALUES (@offset, @limit)
	RETURN
END