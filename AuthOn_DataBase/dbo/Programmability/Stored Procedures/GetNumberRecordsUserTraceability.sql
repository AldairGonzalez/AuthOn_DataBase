CREATE PROCEDURE [dbo].[GetNumberRecordsUserTraceability](
	@userId BIGINT = NULL,
	@performedBy BIGINT = NULL,
	@typeActionId VARCHAR(10) = NULL
)
AS
BEGIN
	
	DECLARE @tableTypeAction TABLE (TypeActionId TINYINT);

	INSERT INTO @tableTypeAction 
		SELECT * FROM [dbo].[SplitTinyInt] (@typeActionId, ',')

	SELECT COUNT(*)
	FROM [dbo].[UserTraceability]
	WHERE
		(@userId IS NULL OR UserId = @userId) AND
		(@performedBy IS NULL OR PerformedBy = @performedBy) AND
		(@typeActionId IS NULL OR TypeActionId IN (SELECT TypeActionId FROM @tableTypeAction))
END