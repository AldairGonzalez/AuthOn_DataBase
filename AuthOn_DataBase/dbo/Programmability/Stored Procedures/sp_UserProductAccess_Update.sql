CREATE PROCEDURE [dbo].[sp_UserProductAccess_Update]
    @UserProductAccessId BIGINT,
    @IsActive            BIT
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE [dbo].[UserProductAccess]
    SET
        [IsActive]           = @IsActive,
        [UpdateRecordMoment] = SYSUTCDATETIME()
    WHERE [UserProductAccessId] = @UserProductAccessId;

    SELECT @@ROWCOUNT;
END
GO