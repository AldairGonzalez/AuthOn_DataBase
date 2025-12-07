CREATE PROCEDURE [dbo].[sp_TypeAction_Get]
    @TypeActionId TINYINT     = NULL,
    @Code         VARCHAR(50) = NULL
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        [TypeActionId],
        [Code]
    FROM [dbo].[TypeAction] WITH(NOLOCK)
    WHERE 
        (@TypeActionId IS NULL OR [TypeActionId] = @TypeActionId) AND
        (@Code IS NULL OR [Code] = @Code);
END
GO