CREATE PROCEDURE [dbo].[sp_Product_Count]
    @Code     VARCHAR(50)   = NULL,
    @Name     NVARCHAR(100) = NULL,
    @IsActive BIT           = NULL
AS
BEGIN
    SET NOCOUNT ON;

    SELECT COUNT(*)
    FROM [dbo].[Product] WITH(NOLOCK)
    WHERE
        (@Code IS NULL OR [Code] LIKE '%' + @Code + '%') AND
        (@Name IS NULL OR [Name] LIKE '%' + @Name + '%') AND
        (@IsActive IS NULL OR [IsActive] = @IsActive)
END
GO