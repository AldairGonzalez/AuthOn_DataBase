CREATE PROCEDURE [dbo].[sp_UserProductAccess_Get]
    @UserProductAccessId BIGINT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        [UserProductAccessId],
        [ProductId],
        [UserId],
        [IsActive],
        [CreationRecordMoment],
        [UpdateRecordMoment]
    FROM [dbo].[UserProductAccess] WITH(NOLOCK)
    WHERE [UserProductAccessId] = @UserProductAccessId;
END
GO