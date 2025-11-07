CREATE PROCEDURE [dbo].[sp_Product_Get]
	@ProductId BIGINT = NULL,
	@Code NVARCHAR(30) = NULL
AS
BEGIN
	SET NOCOUNT ON;

	SELECT
		*
	FROM [dbo].[Product]
	WHERE	(@ProductId IS NULL OR ProductId = @ProductId) AND
			(@Code IS NULL OR Code = @Code);
END