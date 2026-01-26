CREATE PROCEDURE [dbo].[sp_UserProductAccess_Update_ChangeStatus]
    @UserProductAccessId BIGINT,
    @IsActive            BIT
AS
BEGIN
    UPDATE [dbo].[UserProductAccess]
    SET
        [IsActive]           = @IsActive,
        [UpdateRecordMoment] = SYSUTCDATETIME()
    WHERE [UserProductAccessId] = @UserProductAccessId;

    SELECT @@ROWCOUNT;
END
GO