CREATE PROCEDURE [dbo].[sp_User_Delete]
    @UserId BIGINT
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE [dbo].[User]
    SET 
        [IsActive]           = 0,
        [EliminationProcess] = 1,
        [UpdateRecordMoment] = SYSUTCDATETIME()
    WHERE [UserId] = @UserId;
    
    SELECT @@ROWCOUNT;
END
GO