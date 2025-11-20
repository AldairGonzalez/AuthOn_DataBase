CREATE PROCEDURE [dbo].[sp_TypeAction_List]
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
		*
	FROM [dbo].[TypeAction]
END