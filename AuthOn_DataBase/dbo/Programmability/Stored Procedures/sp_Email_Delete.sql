CREATE PROCEDURE [dbo].[sp_Email_Delete]
    @EmailId BIGINT
AS
BEGIN
    DELETE FROM [dbo].[Email]
    WHERE EmailId = @EmailId;
END
GO