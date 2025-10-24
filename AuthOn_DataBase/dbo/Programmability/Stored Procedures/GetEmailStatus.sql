CREATE PROCEDURE [dbo].[GetEmailStatus] (
	@emailStatusId TINYINT = NULL,
	@code NVARCHAR(30) = NULL	
)
AS
BEGIN
	SELECT
		*
	FROM [dbo].[EmailStatus]
	WHERE	(@emailStatusId IS NULL OR EmailStatusId = @emailStatusId) AND
			(@code IS NULL OR Code = @code)
END