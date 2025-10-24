CREATE PROCEDURE [dbo].[GetProduct] (
	@productId BIGINT = NULL,
	@code NVARCHAR(30) = NULL
)
AS
BEGIN
	SELECT
		*
	FROM [dbo].[Product]
	WHERE	(@productId IS NULL OR ProductId = @productId) AND
			(@code IS NULL OR Code = @code);
END