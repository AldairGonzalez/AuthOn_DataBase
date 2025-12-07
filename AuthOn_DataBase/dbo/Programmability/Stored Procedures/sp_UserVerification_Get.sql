CREATE PROCEDURE [dbo].[sp_UserVerification_Get]
    @UserId BIGINT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT *
    FROM [dbo].[UserVerification] WITH(NOLOCK)
    WHERE [UserId] = @UserId;
END
GO