CREATE PROCEDURE [dbo].[sp_UserTraceability_Get]
    @UserTraceabilityId BIGINT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        [UserTraceabilityId],
        [UserId],
        [PerformedById],
        [TypeActionId],
        [IpAddress],
        [Observation],
        [CreationRecordMoment]
    FROM [dbo].[UserTraceability] WITH(NOLOCK)
    WHERE [UserTraceabilityId] = @UserTraceabilityId;
END
GO