CREATE PROCEDURE [dbo].[sp_Product_Delete]
    @ProductId BIGINT
AS
BEGIN
    DELETE FROM [dbo].[Product]
    WHERE ProductId = @ProductId;
END
GO