CREATE PROCEDURE [dbo].[GetEmail] (
	@emailId BIGINT	
)
AS
BEGIN
	SELECT
		*
	FROM [dbo].[Email]
	WHERE	EmailId = @emailId
END