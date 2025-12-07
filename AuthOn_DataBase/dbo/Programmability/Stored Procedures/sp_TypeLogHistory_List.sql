CREATE PROCEDURE [dbo].[sp_TypeLogHistory_List]
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
        [TypeLogHistoryId],
        [Code]
    FROM [dbo].[TypeLogHistory] WITH(NOLOCK)
    ORDER BY [TypeLogHistoryId] ASC;
END
GO