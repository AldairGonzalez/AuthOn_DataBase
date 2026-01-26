CREATE PROCEDURE [dbo].[sp_User_Check]
    @UserName NVARCHAR(100) = NULL,
    @Email    NVARCHAR(255) = NULL
AS
BEGIN
    SET NOCOUNT ON;

    IF @UserName IS NULL AND @Email IS NULL
    BEGIN
        RETURN;
    END

    SELECT TOP 1 1
    FROM [dbo].[User] WITH(NOLOCK)
    WHERE 
        (@UserName IS NOT NULL AND [UserName] = @UserName) 
        OR
        (@Email IS NOT NULL AND [Email] = @Email);
END
GO