CREATE PROCEDURE [dbo].[sp_UserToken_Create]
    @UserId BIGINT,
    @TokenTypeId TINYINT,
    @Token NVARCHAR(MAX),
    @IsUsed BIT,
    @Revoked BIT,
    @CreationRecordMoment DATETIME2,
    @UpdateRecordMoment DATETIME2 = NULL
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO [dbo].[UserToken] (
        UserId,
        TokenTypeId,
        Token,
        IsUsed,
        Revoked,
        CreationRecordMoment,
        UpdateRecordMoment
    )
    VALUES (
        @UserId,
        @TokenTypeId,
        @Token,
        @IsUsed,
        @Revoked,
        @CreationRecordMoment,
        @UpdateRecordMoment
    );

    SELECT SCOPE_IDENTITY();
END