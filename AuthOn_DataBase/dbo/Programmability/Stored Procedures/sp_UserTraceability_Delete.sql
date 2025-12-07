CREATE PROCEDURE [dbo].[sp_UserTraceability_Delete]
    @UserTraceabilityId BIGINT
AS
BEGIN
    SET NOCOUNT ON;

    DELETE FROM [dbo].[UserTraceability]
    WHERE [UserTraceabilityId] = @UserTraceabilityId;

    SELECT @@ROWCOUNT;
END
GO