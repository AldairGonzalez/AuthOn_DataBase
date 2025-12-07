CREATE PROCEDURE [dbo].[sp_User_Update]
    @UserId                     BIGINT,
    @UserName                   NVARCHAR(100),
    @LanguageId                 TINYINT,
    @TwoFactorEnabled           BIT,
    @IsActive                   BIT,
    @IsAdmin                    BIT,
    @EmailConfirmed             BIT,
    @ChangePasswordOnNextSignIn BIT,
    @EliminationProcess         BIT
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE [dbo].[User]
    SET
        [UserName]                   = @UserName,
        [LanguageId]                 = @LanguageId,
        [TwoFactorEnabled]           = @TwoFactorEnabled,
        [IsActive]                   = @IsActive,
        [IsAdmin]                    = @IsAdmin,
        [EmailConfirmed]             = @EmailConfirmed,
        [ChangePasswordOnNextSignIn] = @ChangePasswordOnNextSignIn,
        [EliminationProcess]         = @EliminationProcess,
        [UpdateRecordMoment]         = SYSUTCDATETIME()
    WHERE [UserId] = @UserId;

    SELECT @@ROWCOUNT;
END
GO