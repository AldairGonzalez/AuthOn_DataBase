CREATE PROCEDURE [dbo].[sp_Product_Get]
    @ProductId BIGINT      = NULL,
    @Code      VARCHAR(50) = NULL
AS
BEGIN
    SET NOCOUNT ON;

    IF @ProductId IS NULL AND @Code IS NULL
    BEGIN
        RETURN;
    END

    SELECT TOP 1
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
        (@ProductId IS NOT NULL AND [ProductId] = @ProductId)
        OR
        (@Code IS NOT NULL AND [Code] = @Code);
END
GO