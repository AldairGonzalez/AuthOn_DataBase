CREATE PROCEDURE [dbo].[GetNumberRecordsEmails](
	@subject NVARCHAR(MAX),
	@recipients NVARCHAR(MAX),
	@body NVARCHAR(MAX),
	@emailStatusId TINYINT = NULL,
	@seen BIT = NULL
)
AS
BEGIN
	SELECT COUNT(*)
	FROM [dbo].[Email]
	WHERE
		[Subject] LIKE '%' + @subject + '%' AND
		Recipients LIKE '%' + @recipients + '%' AND
		Body LIKE '%' + @body + '%' AND
		(@emailStatusId IS NULL OR EmailStatusId = @emailStatusId) AND
		(@seen IS NULL OR Seen = @seen);
END