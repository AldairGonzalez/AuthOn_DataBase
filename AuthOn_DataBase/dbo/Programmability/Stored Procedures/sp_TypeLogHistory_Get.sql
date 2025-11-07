CREATE PROCEDURE [dbo].[sp_TypeLogHistory_Get]
    @TypeLogHistoryId TINYINT = NULL,
    @Code NVARCHAR(30) = NULL
AS
BEGIN
    SET NOCOUNT ON;

    SELECT *
    FROM [dbo].[TypeLogHistory]
    WHERE (@TypeLogHistoryId IS NULL OR TypeLogHistoryId = @TypeLogHistoryId) AND
          (@Code IS NULL OR Code = @Code);
END