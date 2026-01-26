CREATE PROCEDURE [dbo].[sp_User_Update_Profile]
    @UserId     BIGINT,
    @UserName   NVARCHAR(100),
    @Email      NVARCHAR(255),
    @LanguageId TINYINT
AS
BEGIN
    UPDATE [dbo].[User]
    SET 
        [UserName] = @UserName,
        [LanguageId] = @LanguageId,
        [Email] = @Email,
        [UpdateRecordMoment] = SYSUTCDATETIME()
    WHERE [UserId] = @UserId;
END
GO