CREATE PROCEDURE [dbo].[sp_EmailStatus_Get]
    @EmailStatusId TINYINT     = NULL,
    @Code          VARCHAR(50) = NULL
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
        [EmailStatusId],
        [Code]
    FROM [dbo].[EmailStatus] WITH(NOLOCK)
    WHERE 
        (@EmailStatusId IS NULL OR [EmailStatusId] = @EmailStatusId) AND
        (@Code IS NULL OR [Code] = @Code);
END
GO