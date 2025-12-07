CREATE PROCEDURE [dbo].[sp_Product_List]
    @IsActive BIT = NULL
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
        (@IsActive IS NULL OR [IsActive] = @IsActive)
    ORDER BY [Name] ASC;
END
GO