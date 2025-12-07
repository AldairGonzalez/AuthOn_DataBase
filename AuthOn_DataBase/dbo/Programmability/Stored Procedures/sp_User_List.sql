CREATE PROCEDURE [dbo].[sp_User_List]
    @UserName       NVARCHAR(100) = NULL,
    @Email          NVARCHAR(255) = NULL,
    @IsActive       BIT = NULL,
    @IsAdmin        BIT = NULL,
    @EmailConfirmed BIT = NULL,
    @PageIndex      INT = NULL,
    @PageSize       INT = NULL
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @TotalRecords INT
    DECLARE @CountResult TABLE (Total INT);
    
    INSERT INTO @CountResult EXEC [dbo].[sp_User_Count] 
        @UserName, @Email, @IsActive, @IsAdmin, @EmailConfirmed;
        
    SELECT @TotalRecords = Total FROM @CountResult;

    DECLARE @Offset INT, @Limit INT
    SELECT @Offset = Offset, @Limit = Limit 
    FROM [dbo].[fn_PaginationData_Get](@PageIndex, @PageSize, @TotalRecords);

    SELECT *
    FROM [dbo].[User] WITH(NOLOCK)
    WHERE
        (@UserName IS NULL OR [UserName] LIKE '%' + @UserName + '%') AND
        (@Email IS NULL OR [Email] LIKE '%' + @Email + '%') AND
        (@IsActive IS NULL OR [IsActive] = @IsActive) AND
        (@IsAdmin IS NULL OR [IsAdmin] = @IsAdmin) AND
        (@EmailConfirmed IS NULL OR [EmailConfirmed] = @EmailConfirmed)
    ORDER BY [UserName] ASC
    OFFSET @Offset ROWS
    FETCH NEXT @Limit ROWS ONLY;
END
GO