CREATE PROCEDURE [dbo].[ListUsers](
	@userName NVARCHAR(50),
	@email NVARCHAR(255),
	@changePassword VARCHAR(10) = NULL,
	@emailConfirmed VARCHAR(10) = NULL,
	@isActive VARCHAR(10) = NULL,
	@isAdmin VARCHAR(10) = NULL,
	@eliminationProcess VARCHAR(10) = NULL,
	@pageIndex INT = NULL,
	@pageSize INT = NULL
)
AS
BEGIN
	DECLARE @tableChangePassword TABLE (ChangePassword BIT);
	DECLARE @tableEliminationProcess TABLE (EliminationProcess BIT);
	DECLARE @tableEmailConfirmed TABLE (EmailConfirmed BIT);
	DECLARE @tableIsActive TABLE (IsActive BIT);
	DECLARE @tableIsAdmin TABLE (IsAdmin BIT);
	DECLARE @tableTotalRecords TABLE (TotalRecords INT)
	DECLARE @totalRecords INT
	DECLARE @offset INT
	DECLARE @limit INT

	INSERT INTO @tableTotalRecords (TotalRecords) EXEC [dbo].[GetNumberRecordsUsers]
		@userName = @userName,
		@email = @email,
		@changePassword = @changePassword,
		@emailConfirmed = @emailConfirmed,
		@isActive = @isActive,
		@isAdmin = @isAdmin,
		@eliminationProcess = @eliminationProcess

	SELECT @totalRecords = TotalRecords FROM @tableTotalRecords

	SELECT	@offset = Offset, 
			@limit = Limit 
	FROM [dbo].[GetPaginationData] (@pageIndex, @pageSize, @totalRecords)

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

	SELECT *
	FROM [dbo].[User]
	WHERE
		UserName LIKE '%' + @userName + '%' AND
		Email LIKE '%' + @email + '%' AND
		(@changePassword IS NULL OR ChangePassword IN (SELECT ChangePassword FROM @tableChangePassword)) AND
		(@emailConfirmed IS NULL OR EmailConfirmed IN (SELECT EmailConfirmed FROM @tableEmailConfirmed)) AND
		(@isActive IS NULL OR IsActive IN (SELECT IsActive FROM @tableIsActive)) AND
		(@isAdmin IS NULL OR IsAdmin IN (SELECT IsAdmin FROM @tableIsAdmin)) AND
		(@eliminationProcess IS NULL OR EliminationProcess IN (SELECT EliminationProcess FROM @tableEliminationProcess))
	ORDER BY UserId
	OFFSET @offset ROWS
	FETCH NEXT @limit ROWS ONLY
END