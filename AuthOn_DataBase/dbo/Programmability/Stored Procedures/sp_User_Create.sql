CREATE PROCEDURE [dbo].[sp_User_Create]
    @UserName       NVARCHAR(100),
    @Email          NVARCHAR(255),
    @PasswordHash   VARCHAR(255),
    @LanguageId     TINYINT,
    @TwoFactorEnabled BIT = 0
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO [dbo].[User] (
        [UserName],
        [Email],
        [PasswordHash],
        [LanguageId],
        [TwoFactorEnabled]
    )
    VALUES (
        @UserName,
        @Email,
        @PasswordHash,
        @LanguageId,
        @TwoFactorEnabled
    );

    SELECT CAST(SCOPE_IDENTITY() AS BIGINT);
END
GO