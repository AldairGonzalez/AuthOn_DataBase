CREATE PROCEDURE [dbo].[sp_Email_Get]
    @EmailId BIGINT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT *
    FROM [dbo].[Email] WITH(NOLOCK)
    WHERE EmailId = @EmailId;
END
GO