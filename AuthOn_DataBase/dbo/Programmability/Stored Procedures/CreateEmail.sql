CREATE PROCEDURE [dbo].[CreateEmail] (
	@subject NVARCHAR(MAX),
	@recipients NVARCHAR(MAX),
	@body NVARCHAR(MAX),
	@emailStatusId TINYINT
)
AS
BEGIN
	INSERT INTO [dbo].[Email]
	(
		[Subject],
		Recipients,
		Body,
		EmailStatusId
	)
	VALUES
	(
		@subject,
		@recipients,
		@body,
		@emailStatusId
	)
	SELECT CAST(SCOPE_IDENTITY() AS BIGINT)
END