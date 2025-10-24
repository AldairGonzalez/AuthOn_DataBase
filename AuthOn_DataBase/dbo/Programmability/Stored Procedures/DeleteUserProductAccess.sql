CREATE PROCEDURE [dbo].[DeleteUserProductAccess] (
	@userProductAccessId BIGINT	
)
AS
BEGIN
	DELETE FROM 
		[dbo].[UserProductAccess]
	WHERE 
		UserProductAccessId = @userProductAccessId
END