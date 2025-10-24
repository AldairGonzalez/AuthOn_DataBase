CREATE PROCEDURE [dbo].[ListEmails](
	@subject NVARCHAR(MAX),
	@recipients NVARCHAR(MAX),
	@body NVARCHAR(MAX),
	@emailStatusId TINYINT = NULL,
	@seen BIT = NULL,
	@pageIndex INT = NULL,
	@pageSize INT = NULL
)
AS
BEGIN
	DECLARE @tableTotalRecords TABLE (TotalRecords INT)
	DECLARE @totalRecords INT
	DECLARE @offset INT
	DECLARE @limit INT

	INSERT INTO @tableTotalRecords (TotalRecords) EXEC [dbo].[GetNumberRecordsEmails]
		@subject = @subject,
		@recipients = @recipients,
		@body = @body,
		@emailStatusId = @emailStatusId,
		@seen = @seen

	SELECT @totalRecords = TotalRecords FROM @tableTotalRecords

	SELECT	@offset = Offset, 
			@limit = Limit 
	FROM [dbo].[GetPaginationData] (@pageIndex, @pageSize, @totalRecords)

	SELECT *
	FROM [dbo].[Email]
	WHERE
		[Subject] LIKE '%' + @subject + '%' AND
		Body LIKE '%' + @body + '%' AND
		Recipients LIKE '%' + @recipients + '%' AND
		(@emailStatusId IS NULL OR EmailStatusId = @emailStatusId) AND
		(@seen IS NULL OR Seen = @seen)
	ORDER BY EmailId
	OFFSET @offset ROWS
	FETCH NEXT @limit ROWS ONLY
END