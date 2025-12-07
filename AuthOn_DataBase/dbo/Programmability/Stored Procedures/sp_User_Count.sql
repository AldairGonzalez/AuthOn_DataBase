CREATE PROCEDURE [dbo].[sp_User_Count]
    @UserName       NVARCHAR(100) = NULL,
    @Email          NVARCHAR(255) = NULL,
    @IsActive       BIT = NULL,
    @IsAdmin        BIT = NULL,
    @EmailConfirmed BIT = NULL
AS
BEGIN
    SET NOCOUNT ON;

    SELECT COUNT(*)
    FROM [dbo].[User] WITH(NOLOCK)
    WHERE
        (@UserName IS NULL OR [UserName] LIKE '%' + @UserName + '%') AND
        (@Email IS NULL OR [Email] LIKE '%' + @Email + '%') AND
        (@IsActive IS NULL OR [IsActive] = @IsActive) AND
        (@IsAdmin IS NULL OR [IsAdmin] = @IsAdmin) AND
        (@EmailConfirmed IS NULL OR [EmailConfirmed] = @EmailConfirmed);
END
GO