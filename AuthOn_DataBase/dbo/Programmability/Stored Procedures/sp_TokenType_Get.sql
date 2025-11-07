CREATE PROCEDURE [dbo].[sp_TokenType_Get]
    @TokenTypeId TINYINT = NULL,
    @Code NVARCHAR(30) = NULL
AS
BEGIN
    SET NOCOUNT ON;

    SELECT *
    FROM [dbo].[TokenType]
    WHERE (@TokenTypeId IS NULL OR TokenTypeId = @TokenTypeId) AND
          (@Code IS NULL OR Code = @Code);
END