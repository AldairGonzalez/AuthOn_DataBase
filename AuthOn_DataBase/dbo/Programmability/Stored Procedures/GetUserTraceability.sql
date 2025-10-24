CREATE PROCEDURE [dbo].[GetUserTraceability] (
	@userTraceabilityId BIGINT
)
AS
BEGIN
	SELECT
		*
	FROM [dbo].[UserTraceability]
	WHERE	UserTraceabilityId = @userTraceabilityId
END