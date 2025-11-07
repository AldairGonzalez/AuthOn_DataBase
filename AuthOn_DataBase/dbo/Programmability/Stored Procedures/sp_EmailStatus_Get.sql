CREATE PROCEDURE [dbo].[sp_EmailStatus_Get]
	@EmailStatusId TINYINT = NULL,
	@Code NVARCHAR(30) = NULL	
AS
BEGIN
	SET NOCOUNT ON;

	SELECT
		*
	FROM [dbo].[EmailStatus]
	WHERE	(@EmailStatusId IS NULL OR EmailStatusId = @EmailStatusId) AND
			(@Code IS NULL OR Code = @Code)
END