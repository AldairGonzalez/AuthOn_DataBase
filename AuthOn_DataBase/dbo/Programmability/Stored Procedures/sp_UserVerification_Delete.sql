CREATE PROCEDURE [dbo].[sp_UserVerification_Delete]
    @UserId BIGINT
AS
BEGIN
    DELETE FROM [dbo].[UserVerification]
    WHERE UserId = @UserId;
END
GO