CREATE PROCEDURE [dbo].[sp_EmailStatus_List]
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
        [EmailStatusId],
        [Code]
    FROM [dbo].[EmailStatus] WITH(NOLOCK)
    ORDER BY [EmailStatusId] ASC;
END
GO