CREATE PROCEDURE [dbo].[sp_TokenType_Get]
    @TokenTypeId TINYINT     = NULL,
    @Code        VARCHAR(50) = NULL
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        [TokenTypeId],
        [Code],
        [DurationInMinutes]
    FROM [dbo].[TokenType] WITH(NOLOCK)
    WHERE 
        (@TokenTypeId IS NULL OR [TokenTypeId] = @TokenTypeId) AND
        (@Code IS NULL OR [Code] = @Code);
END
GO