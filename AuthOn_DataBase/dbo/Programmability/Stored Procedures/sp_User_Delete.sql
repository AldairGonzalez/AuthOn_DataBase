CREATE PROCEDURE [dbo].[sp_User_Delete]
    @UserId BIGINT
AS
BEGIN
    DELETE FROM [dbo].[User]
    WHERE [UserId] = @UserId;
END
GO