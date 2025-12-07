CREATE PROCEDURE [dbo].[sp_TypeAction_List]
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
        [TypeActionId],
        [Code]
    FROM [dbo].[TypeAction] WITH(NOLOCK)
    ORDER BY [TypeActionId] ASC;
END
GO