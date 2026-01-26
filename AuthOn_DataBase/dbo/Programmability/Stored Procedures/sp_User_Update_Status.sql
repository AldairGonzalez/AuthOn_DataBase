CREATE PROCEDURE [dbo].[sp_User_Update_Status]
    @UserId   BIGINT,
    @IsActive BIT
AS
BEGIN
    UPDATE [dbo].[User]
    SET 
        [IsActive]           = @IsActive,
        [UpdateRecordMoment] = SYSUTCDATETIME()
    WHERE [UserId] = @UserId;
END
GO