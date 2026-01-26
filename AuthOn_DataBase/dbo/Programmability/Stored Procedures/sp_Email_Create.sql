CREATE PROCEDURE [dbo].[sp_Email_Create]
    @Subject       NVARCHAR(500),
    @Recipients    NVARCHAR(MAX),
    @Body          NVARCHAR(MAX),
    @EmailStatusId TINYINT
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO [dbo].[Email] (
        [Subject], 
        [Recipients], 
        [Body],
        [EmailStatusId]
    )
    VALUES (
        @Subject, 
        @Recipients, 
        @Body,
        @EmailStatusId
    );

    SELECT CAST(SCOPE_IDENTITY() AS BIGINT);
END
GO