CREATE PROCEDURE [dbo].[sp_Product_List]
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
		*
	FROM [dbo].[Product]
END