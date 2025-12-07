CREATE PROCEDURE [dbo].[sp_Product_Get]
    @ProductId BIGINT      = NULL,
    @Code      VARCHAR(50) = NULL
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
        [ProductId],
        [Code],
        [Name],
        [UrlHome],
        [ApiKey],
        [IsActive],
        [CreationRecordMoment],
        [UpdateRecordMoment]
    FROM [dbo].[Product] WITH(NOLOCK)
    WHERE 
        (@ProductId IS NULL OR [ProductId] = @ProductId) AND
        (@Code IS NULL OR [Code] = @Code);
END
GO