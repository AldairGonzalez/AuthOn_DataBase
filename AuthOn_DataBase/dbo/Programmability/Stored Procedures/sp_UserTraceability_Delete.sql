CREATE PROCEDURE [dbo].[sp_UserTraceability_Delete]
    @UserTraceabilityId BIGINT
AS
BEGIN
    SET NOCOUNT ON;

    DELETE FROM [dbo].[UserTraceability]
    WHERE UserTraceabilityId = @UserTraceabilityId;

    SELECT CAST(CASE WHEN @@ROWCOUNT > 0 THEN 1 ELSE 0 END AS BIT);
END