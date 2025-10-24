CREATE PROCEDURE [dbo].[ListEmailStatuses] (
	@name NVARCHAR(50),
	@description NVARCHAR(MAX) = NULL,
	@code NVARCHAR(30)
)
AS
BEGIN
	SELECT
		*
	FROM [dbo].[EmailStatus]
	WHERE	[Name] LIKE '%' + @name + '%' AND
			(@description IS NULL OR [Description] LIKE '%' + @description + '%') AND
			Code LIKE '%' + @code + '%'
END