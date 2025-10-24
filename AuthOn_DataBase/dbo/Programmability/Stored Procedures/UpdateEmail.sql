CREATE PROCEDURE [dbo].[UpdateEmail] (
	@emailId BIGINT,
	@subject NVARCHAR(MAX),
	@recipients NVARCHAR(MAX),
	@body NVARCHAR(MAX),
	@emailStatusId TINYINT,
	@seen BIT
)
AS
BEGIN
	UPDATE [dbo].[Email]
	SET
		[Subject] = @subject,
		Recipients = @recipients,
		Body = @body,
		EmailStatusId = @emailStatusId,
		Seen = @seen,
		UpdateRecordMoment = SYSUTCDATETIME()
	WHERE
		EmailId = @emailId
END