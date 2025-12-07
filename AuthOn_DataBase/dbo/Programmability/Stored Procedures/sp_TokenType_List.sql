CREATE PROCEDURE [dbo].[sp_TokenType_List]
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
        [TokenTypeId],
        [Code],
        [DurationInMinutes]
    FROM [dbo].[TokenType] WITH(NOLOCK)
    ORDER BY [TokenTypeId] ASC;
END
GO