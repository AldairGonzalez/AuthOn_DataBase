CREATE PROCEDURE [dbo].[sp_EmailStatus_List]
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
		*
	FROM [dbo].[EmailStatus]
END