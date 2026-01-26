CREATE PROCEDURE [dbo].[sp_EmailStatus_Get]
    @EmailStatusId TINYINT     = NULL,
    @Code          VARCHAR(50) = NULL
AS
BEGIN
    SET NOCOUNT ON;

    IF @EmailStatusId IS NULL AND @Code IS NULL
    BEGIN
        RETURN;
    END

    SELECT TOP 1
        [EmailStatusId],
        [Code]
    FROM [dbo].[EmailStatus] WITH(NOLOCK)
    WHERE 
        (@EmailStatusId IS NOT NULL AND [EmailStatusId] = @EmailStatusId)
        OR
        (@Code IS NOT NULL AND [Code] = @Code);
END
GO