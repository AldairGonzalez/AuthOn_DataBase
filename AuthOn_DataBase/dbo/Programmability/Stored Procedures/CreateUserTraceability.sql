CREATE PROCEDURE [dbo].[CreateUserTraceability] (
	@userId BIGINT,
	@performedBy BIGINT = NULL,
	@typeActionId TINYINT,
	@ipAddress NVARCHAR(45) = NULL,
	@observation NVARCHAR(MAX) = NULL
)
AS
BEGIN
	INSERT INTO [dbo].[UserTraceability]
	(
		UserId,
		PerformedBy,
		TypeActionId,
		IpAddress,
		Observation
	)
	VALUES
	(
		@userId,
		@performedBy,
		@typeActionId,
		@ipAddress,
		@observation
	)
	SELECT CAST(SCOPE_IDENTITY() AS BIGINT)
END