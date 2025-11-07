CREATE PROCEDURE [dbo].[sp_TypeAction_Get]
    @TypeActionId TINYINT = NULL,
    @Code NVARCHAR(30) = NULL
AS
BEGIN
    SET NOCOUNT ON;

    SELECT *
    FROM [dbo].[TypeAction]
    WHERE (@TypeActionId IS NULL OR TypeActionId = @TypeActionId) AND
          (@Code IS NULL OR Code = @Code);
END