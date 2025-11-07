CREATE PROCEDURE [dbo].[sp_User_Create]
    @UserName NVARCHAR(50),
    @Email NVARCHAR(255),
    @PasswordHash NVARCHAR(255),
    @ChangePasswordOnNextSignIn BIT,
    @EmailConfirmed BIT,
    @AuthenticationAttempts TINYINT,
    @IsActive BIT,
    @IsAdmin BIT,
    @EliminationProcess BIT,
    @LanguageId TINYINT,
    @CreationRecordMoment DATETIME2,
    @UpdateRecordMoment DATETIME2 = NULL
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO [dbo].[User] (
        UserName,
        Email,
        PasswordHash,
        ChangePasswordOnNextSignIn,
        EmailConfirmed,
        AuthenticationAttempts,
        IsActive,
        IsAdmin,
        EliminationProcess,
        LanguageId,
        CreationRecordMoment,
        UpdateRecordMoment
    )
    VALUES (
        @UserName,
        @Email,
        @PasswordHash,
        @ChangePasswordOnNextSignIn,
        @EmailConfirmed,
        @AuthenticationAttempts,
        @IsActive,
        @IsAdmin,
        @EliminationProcess,
        @LanguageId,
        @CreationRecordMoment,
        @UpdateRecordMoment
    );

    SELECT SCOPE_IDENTITY();
END