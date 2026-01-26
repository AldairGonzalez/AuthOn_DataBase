CREATE PROCEDURE [dbo].[sp_User_Get]
    @UserId   BIGINT        = NULL,
    @UserName NVARCHAR(100) = NULL,
    @Email    NVARCHAR(255) = NULL
AS
BEGIN
    SET NOCOUNT ON;

    IF @UserId IS NULL AND @UserName IS NULL AND @Email IS NULL
    BEGIN
        RETURN;
    END

    SELECT TOP 1
        [UserId],
        [UserName],
        [Email],
        [PasswordHash],
        [LanguageId],
        [TwoFactorEnabled],
        [IsActive],
        [IsAdmin],
        [EmailConfirmed],
        [AuthenticationAttempts],
        [ChangePasswordOnNextSignIn],
        [EliminationProcess],
        [CreationRecordMoment],
        [UpdateRecordMoment]
    FROM [dbo].[User] WITH(NOLOCK)
    WHERE 
        (@UserId IS NOT NULL AND [UserId] = @UserId)
        OR
        (@UserName IS NOT NULL AND [UserName] = @UserName)
        OR
        (@Email IS NOT NULL AND [Email] = @Email);
END
GO