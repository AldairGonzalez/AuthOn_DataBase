CREATE PROCEDURE [dbo].[ListUserTraceability](
	@userId BIGINT = NULL,
	@performedBy BIGINT = NULL,
	@typeActionId VARCHAR(10) = NULL,
	@pageIndex INT = NULL,
	@pageSize INT = NULL
)
AS
BEGIN
	DECLARE @tableTypeAction TABLE (TypeActionId TINYINT);
	DECLARE @tableTotalRecords TABLE (TotalRecords INT)
	DECLARE @totalRecords INT
	DECLARE @offset INT
	DECLARE @limit INT

	INSERT INTO @tableTotalRecords (TotalRecords) EXEC [dbo].[GetNumberRecordsUserTraceability]
		@userId = @userId,
		@performedBy = @performedBy,
		@typeActionId = @typeActionId

	SELECT @totalRecords = TotalRecords FROM @tableTotalRecords

	SELECT	@offset = Offset, 
			@limit = Limit 
	FROM [dbo].[GetPaginationData] (@pageIndex, @pageSize, @totalRecords)

	INSERT INTO @tableTypeAction 
		SELECT * FROM [dbo].[SplitTinyInt] (@typeActionId, ',')

	SELECT *
	FROM [dbo].[UserTraceability]
	WHERE
		(@userId IS NULL OR UserId = @userId) AND
		(@performedBy IS NULL OR PerformedBy = @performedBy) AND
		(@typeActionId IS NULL OR TypeActionId IN (SELECT TypeActionId FROM @tableTypeAction))
	ORDER BY UserTraceabilityId
	OFFSET @offset ROWS
	FETCH NEXT @limit ROWS ONLY
END