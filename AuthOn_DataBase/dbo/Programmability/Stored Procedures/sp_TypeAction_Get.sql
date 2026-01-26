CREATE PROCEDURE [dbo].[sp_TypeAction_Get]
    @TypeActionId TINYINT     = NULL,
    @Code         VARCHAR(50) = NULL
AS
BEGIN
    SET NOCOUNT ON;

    IF @TypeActionId IS NULL AND @Code IS NULL
    BEGIN
        RETURN;
    END

    SELECT TOP 1
        [TypeActionId],
        [Code]
    FROM [dbo].[TypeAction] WITH(NOLOCK)
    WHERE 
        (@TypeActionId IS NOT NULL AND [TypeActionId] = @TypeActionId)
        OR
        (@Code IS NOT NULL AND [Code] = @Code);
END
GO