CREATE PROCEDURE [dbo].[sp_UserTraceability_Delete]
    @UserTraceabilityId BIGINT
AS
BEGIN
    DELETE FROM [dbo].[UserTraceability]
    WHERE [UserTraceabilityId] = @UserTraceabilityId;
END
GO