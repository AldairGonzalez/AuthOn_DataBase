CREATE PROCEDURE [dbo].[sp_UserToken_Count]
    @TokenTypeId TINYINT = NULL,
    @UserId      BIGINT  = NULL,
    @Revoked     BIT     = NULL
AS
BEGIN
    SET NOCOUNT ON;

    SELECT COUNT(*)
    FROM [dbo].[UserToken] WITH(NOLOCK)
    WHERE
        (@TokenTypeId IS NULL OR [TokenTypeId] = @TokenTypeId) AND
        (@UserId IS NULL OR [UserId] = @UserId) AND
        (@Revoked IS NULL OR [Revoked] = @Revoked);
END
GO