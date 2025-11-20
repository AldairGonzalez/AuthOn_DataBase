CREATE PROCEDURE [dbo].[sp_TypeLogHistory_List]
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
		*
	FROM [dbo].[TypeLogHistory]
END