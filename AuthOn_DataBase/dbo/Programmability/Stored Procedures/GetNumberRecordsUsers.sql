CREATE PROCEDURE [dbo].[GetNumberRecordsUsers](
	@userName NVARCHAR(50),
	@email NVARCHAR(255),
	@changePassword VARCHAR(10) = NULL,
	@emailConfirmed VARCHAR(10) = NULL,
	@isActive VARCHAR(10) = NULL,
	@isAdmin VARCHAR(10) = NULL,
	@eliminationProcess VARCHAR(10) = NULL
)
AS
BEGIN
	
	DECLARE @tableChangePassword TABLE (ChangePassword BIT);
	DECLARE @tableEliminationProcess TABLE (EliminationProcess BIT);
	DECLARE @tableEmailConfirmed TABLE (EmailConfirmed BIT);
	DECLARE @tableIsActive TABLE (IsActive BIT);
	DECLARE @tableIsAdmin TABLE (IsAdmin BIT);

	INSERT INTO @tableChangePassword 
		SELECT * FROM [dbo].[SplitBit] (@changePassword, ',')

	INSERT INTO @tableEliminationProcess 
		SELECT * FROM [dbo].[SplitBit] (@eliminationProcess, ',')

	INSERT INTO @tableEmailConfirmed
		SELECT * FROM [dbo].[SplitBit] (@emailConfirmed, ',')

	INSERT INTO @tableIsActive
		SELECT * FROM [dbo].[SplitBit] (@isActive, ',')

	INSERT INTO @tableIsAdmin
		SELECT * FROM [dbo].[SplitBit] (@isAdmin, ',')

	SELECT COUNT(*)
	FROM [dbo].[User]
	WHERE
		UserName LIKE '%' + @userName + '%' AND
		Email LIKE '%' + @email + '%' AND
		(@changePassword IS NULL OR ChangePassword IN (SELECT ChangePassword FROM @tableChangePassword)) AND
		(@emailConfirmed IS NULL OR EmailConfirmed IN (SELECT EmailConfirmed FROM @tableEmailConfirmed)) AND
		(@isActive IS NULL OR IsActive IN (SELECT IsActive FROM @tableIsActive)) AND
		(@isAdmin IS NULL OR IsAdmin IN (SELECT IsAdmin FROM @tableIsAdmin)) AND
		(@eliminationProcess IS NULL OR EliminationProcess IN (SELECT EliminationProcess FROM @tableEliminationProcess));
END