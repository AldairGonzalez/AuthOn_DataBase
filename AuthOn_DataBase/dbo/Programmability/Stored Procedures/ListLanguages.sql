CREATE PROCEDURE [dbo].[ListLanguages] (
	@initials NVARCHAR(20),
	@name NVARCHAR(50),
	@isDefault BIT = NULL
)
AS
BEGIN
	SELECT
		*
	FROM [dbo].[Language]
	WHERE	Initials LIKE '%' + @initials + '%' AND
			[Name] LIKE '%' + @name + '%' AND
			(@isDefault IS NULL OR IsDefault = @isDefault)
END