CREATE PROCEDURE [dbo].[sp_User_Count]
    @UserName NVARCHAR(50) = NULL,
    @Email NVARCHAR(255) = NULL,
    @ChangePasswordOnNextSignIn VARCHAR(10) = NULL,
    @EmailConfirmed VARCHAR(10) = NULL,
    @IsActive VARCHAR(10) = NULL,
    @IsAdmin VARCHAR(10) = NULL,
    @EliminationProcess VARCHAR(10) = NULL
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @TableChangePasswordOnNextSignIn TABLE (ChangePasswordOnNextSignIn BIT);
    DECLARE @TableEliminationProcess TABLE (EliminationProcess BIT);
    DECLARE @TableEmailConfirmed TABLE (EmailConfirmed BIT);
    DECLARE @TableIsActive TABLE (IsActive BIT);
    DECLARE @TableIsAdmin TABLE (IsAdmin BIT);

    IF @ChangePasswordOnNextSignIn IS NOT NULL
        INSERT INTO @TableChangePasswordOnNextSignIn 
            SELECT * FROM [dbo].[fn_SplitBit](@ChangePasswordOnNextSignIn, ',');

    IF @EliminationProcess IS NOT NULL
        INSERT INTO @TableEliminationProcess 
            SELECT * FROM [dbo].[fn_SplitBit](@EliminationProcess, ',');

    IF @EmailConfirmed IS NOT NULL
        INSERT INTO @TableEmailConfirmed
            SELECT * FROM [dbo].[fn_SplitBit](@EmailConfirmed, ',');

    IF @IsActive IS NOT NULL
        INSERT INTO @TableIsActive
            SELECT * FROM [dbo].[fn_SplitBit](@IsActive, ',');

    IF @IsAdmin IS NOT NULL
        INSERT INTO @TableIsAdmin
            SELECT * FROM [dbo].[fn_SplitBit](@IsAdmin, ',');

    SELECT COUNT(*)
    FROM [dbo].[User]
    WHERE
        (@UserName IS NULL OR UserName LIKE '%' + @UserName + '%') AND
        (@Email IS NULL OR Email LIKE '%' + @Email + '%') AND
        (@ChangePasswordOnNextSignIn IS NULL OR ChangePasswordOnNextSignIn IN (SELECT ChangePasswordOnNextSignIn FROM @TableChangePasswordOnNextSignIn)) AND
        (@EmailConfirmed IS NULL OR EmailConfirmed IN (SELECT EmailConfirmed FROM @TableEmailConfirmed)) AND
        (@IsActive IS NULL OR IsActive IN (SELECT IsActive FROM @TableIsActive)) AND
        (@IsAdmin IS NULL OR IsAdmin IN (SELECT IsAdmin FROM @TableIsAdmin)) AND
        (@EliminationProcess IS NULL OR EliminationProcess IN (SELECT EliminationProcess FROM @TableEliminationProcess));
END