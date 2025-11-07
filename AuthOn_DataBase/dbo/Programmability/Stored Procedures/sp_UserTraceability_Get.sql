CREATE PROCEDURE [dbo].[sp_UserTraceability_Get]
    @UserTraceabilityId BIGINT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT *
    FROM [dbo].[UserTraceability]
    WHERE UserTraceabilityId = @UserTraceabilityId;
END