CREATE PROCEDURE [dbo].[sp_TokenType_List]
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
		*
	FROM [dbo].[TokenType]
END