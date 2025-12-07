CREATE PROCEDURE [dbo].[sp_Email_Delete]
    @EmailId BIGINT
AS
BEGIN
    SET NOCOUNT ON;

    DELETE FROM [dbo].[Email]
    WHERE EmailId = @EmailId;

    SELECT @@ROWCOUNT;
END
GO