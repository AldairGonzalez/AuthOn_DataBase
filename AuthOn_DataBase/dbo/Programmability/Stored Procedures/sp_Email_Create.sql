CREATE PROCEDURE [dbo].[sp_Email_Create]
    @Subject NVARCHAR(MAX),
    @Recipients NVARCHAR(MAX),
    @Body NVARCHAR(MAX),
    @EmailStatusId TINYINT,
    @Seen BIT,
    @CreationRecordMoment DATETIME2,
    @UpdateRecordMoment DATETIME2 = NULL
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO [dbo].[Email] (
        [Subject], 
        Recipients, 
        Body,
        EmailStatusId, 
        Seen,
        CreationRecordMoment, 
        UpdateRecordMoment
    )
    VALUES (
        @Subject, 
        @Recipients, 
        @Body,
        @EmailStatusId, 
        @Seen,
        @CreationRecordMoment, 
        @UpdateRecordMoment
    );

    SELECT SCOPE_IDENTITY();
END