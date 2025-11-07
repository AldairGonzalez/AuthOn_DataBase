CREATE PROCEDURE [dbo].[sp_UserProductAccess_Update]
    @UserProductAccessId BIGINT,
    @IsActive TINYINT,
    @UpdateRecordMoment DATETIME2
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE [dbo].[UserProductAccess]
    SET
        IsActive = @IsActive,
        UpdateRecordMoment = @UpdateRecordMoment
    WHERE UserProductAccessId = @UserProductAccessId;

    SELECT @@ROWCOUNT;
END