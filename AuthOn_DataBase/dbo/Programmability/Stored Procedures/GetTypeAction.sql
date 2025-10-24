CREATE PROCEDURE [dbo].[GetTypeAction] (
	@typeActionId TINYINT = NULL,
	@code NVARCHAR(30) = NULL
)
AS
BEGIN
	SELECT
		*
	FROM [dbo].[TypeAction]
	WHERE	(@typeActionId IS NULL OR TypeActionId = @typeActionId) AND
			(@code IS NULL OR Code = @code);
END