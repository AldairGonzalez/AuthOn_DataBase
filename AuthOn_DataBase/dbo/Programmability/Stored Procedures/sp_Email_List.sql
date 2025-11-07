CREATE PROCEDURE [dbo].[sp_Email_List]
    @Subject NVARCHAR(MAX) = NULL,
    @Recipients NVARCHAR(MAX) = NULL,
    @EmailStatusId TINYINT = NULL,
    @Seen BIT = NULL,
    @PageIndex INT = NULL,
    @PageSize INT = NULL
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @TableTotalRecords TABLE (TotalRecords INT)
    DECLARE @TotalRecords INT
    DECLARE @Offset INT
    DECLARE @Limit INT

    INSERT INTO @TableTotalRecords (TotalRecords) EXEC [dbo].[sp_Email_Count]
        @Subject = @Subject,
        @Recipients = @Recipients,
        @EmailStatusId = @EmailStatusId,
        @Seen = @Seen

    SELECT @TotalRecords = TotalRecords FROM @TableTotalRecords

    SELECT @Offset = Offset, 
           @Limit = Limit 
    FROM [dbo].[fn_PaginationData_Get](@PageIndex, @PageSize, @TotalRecords)

    SELECT *
    FROM [dbo].[Email]
    WHERE
        (@Subject IS NULL OR [Subject] LIKE '%' + @Subject + '%') AND
        (@Recipients IS NULL OR Recipients LIKE '%' + @Recipients + '%') AND
        (@EmailStatusId IS NULL OR EmailStatusId = @EmailStatusId) AND
        (@Seen IS NULL OR Seen = @Seen)
    ORDER BY EmailId
    OFFSET @Offset ROWS
    FETCH NEXT @Limit ROWS ONLY
END