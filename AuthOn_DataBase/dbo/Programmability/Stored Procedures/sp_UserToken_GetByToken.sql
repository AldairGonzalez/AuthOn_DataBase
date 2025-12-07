CREATE PROCEDURE [dbo].[sp_UserToken_GetByToken]
    @Token VARCHAR(255)
AS
BEGIN
    SET NOCOUNT ON;

    SELECT *
    FROM [dbo].[UserToken] WITH(NOLOCK)
    WHERE [Token] = @Token;
END
GO