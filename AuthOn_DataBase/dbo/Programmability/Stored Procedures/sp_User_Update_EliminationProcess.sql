CREATE PROCEDURE [dbo].[sp_User_Update_EliminationProcess]
    @UserId             BIGINT,
    @EliminationProcess BIT
AS
BEGIN
    UPDATE [dbo].[User]
    SET 
        [EliminationProcess] = @EliminationProcess,
        [UpdateRecordMoment] = SYSUTCDATETIME()
    WHERE [UserId] = @UserId;
END
GO