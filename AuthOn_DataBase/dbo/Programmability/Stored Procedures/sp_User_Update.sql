CREATE PROCEDURE [dbo].[sp_User_Update]
    @UserId BIGINT,
    @UserName NVARCHAR(50),
    @Email NVARCHAR(255),
    @PasswordHash NVARCHAR(MAX),
    @ChangePasswordOnNextSignIn TINYINT,
    @EmailConfirmed TINYINT,
    @AuthenticationAttempts TINYINT,
    @IsActive TINYINT,
    @EliminationProcess TINYINT,
    @LanguageId TINYINT,
    @SecurityCode NVARCHAR(6),
    @SecurityCodeExpiration DATETIME2,
    @UpdateRecordMoment DATETIME2
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE [dbo].[User]
    SET
        UserName = @UserName,
        Email = @Email,
        PasswordHash = @PasswordHash,
        ChangePasswordOnNextSignIn = @ChangePasswordOnNextSignIn,
        EmailConfirmed = @EmailConfirmed,
        AuthenticationAttempts = @AuthenticationAttempts,
        IsActive = @IsActive,
        EliminationProcess = @EliminationProcess,
        LanguageId = @LanguageId,
        SecurityCode = @SecurityCode,
        SecurityCodeExpiration = @SecurityCodeExpiration,
        UpdateRecordMoment = @UpdateRecordMoment
    WHERE UserId = @UserId;

    SELECT @@ROWCOUNT;
END