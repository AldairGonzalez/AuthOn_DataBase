CREATE PROCEDURE [dbo].[sp_Email_Count]
	@Subject NVARCHAR(MAX) = NULL,
	@Recipients NVARCHAR(MAX) = NULL,
	@EmailStatusId TINYINT = NULL,
	@Seen BIT = NULL
AS
BEGIN
	SET NOCOUNT ON;

	SELECT COUNT(*)
	FROM [dbo].[Email]
	WHERE
		(@Subject IS NULL OR [Subject] LIKE '%' + @Subject + '%') AND
		(@Recipients IS NULL OR Recipients LIKE '%' + @Recipients + '%') AND
		(@EmailStatusId IS NULL OR EmailStatusId = @EmailStatusId ) AND
		(@Seen IS NULL OR Seen = @Seen);
END