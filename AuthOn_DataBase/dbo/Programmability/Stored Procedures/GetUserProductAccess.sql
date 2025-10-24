CREATE PROCEDURE [dbo].[GetUserProductAccess] (
	@userProductAccessId BIGINT	
)
AS
BEGIN
	SELECT
		*
	FROM [dbo].[UserProductAccess]
	WHERE	UserProductAccessId = @userProductAccessId
END