CREATE PROCEDURE [dbo].[UpdateUserProductAccess] (
	@userProductAccessId BIGINT,
	@isActive BIT
)
AS
BEGIN
	UPDATE [dbo].[UserProductAccess]
	SET
		IsActive = @isActive,
		UpdateRecordMoment = SYSUTCDATETIME()
	WHERE
		UserProductAccessId = @userProductAccessId
END