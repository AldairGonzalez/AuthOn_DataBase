CREATE PROCEDURE [dbo].[sp_TokenType_Get]
    @TokenTypeId TINYINT     = NULL,
    @Code        VARCHAR(50) = NULL
AS
BEGIN
    SET NOCOUNT ON;

    IF @TokenTypeId IS NULL AND @Code IS NULL
    BEGIN
        RETURN;
    END

    SELECT TOP 1
        [TokenTypeId],
        [Code],
        [DurationInMinutes]
    FROM [dbo].[TokenType] WITH(NOLOCK)
    WHERE 
        (@TokenTypeId IS NOT NULL AND [TokenTypeId] = @TokenTypeId)
        OR
        (@Code IS NOT NULL AND [Code] = @Code);
END
GO