CREATE PROCEDURE [dbo].[sp_Language_List]
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
		*
	FROM [dbo].[Language]
END
