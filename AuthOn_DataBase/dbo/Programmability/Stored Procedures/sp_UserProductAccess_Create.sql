CREATE PROCEDURE [dbo].[sp_UserProductAccess_Create]
    @ProductId BIGINT,
    @UserId BIGINT,
    @IsActive TINYINT,
    @CreationRecordMoment DATETIME2,
    @UpdateRecordMoment DATETIME2 = NULL
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO [dbo].[UserProductAccess] (
        ProductId, 
        UserId, 
        IsActive,
        CreationRecordMoment, 
        UpdateRecordMoment
    )
    VALUES (
        @ProductId, 
        @UserId, 
        @IsActive,
        @CreationRecordMoment, 
        @UpdateRecordMoment
    );

    SELECT SCOPE_IDENTITY();
END