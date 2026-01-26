CREATE PROCEDURE [dbo].[sp_Email_List]
    @Subject       NVARCHAR(500) = NULL,
    @Recipients    NVARCHAR(MAX) = NULL,
    @EmailStatusId TINYINT       = NULL,
    @Seen          BIT           = NULL,
    @PageIndex     INT           = NULL,
    @PageSize      INT           = NULL
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @TotalRecords INT
    DECLARE @CountResult TABLE (Total INT);

    INSERT INTO @CountResult EXEC [dbo].[sp_Email_Count] 
        @Subject, @Recipients, @EmailStatusId, @Seen;
        
    SELECT @TotalRecords = Total FROM @CountResult;

    DECLARE @Offset INT, @Limit INT
    SELECT @Offset = Offset, @Limit = Limit 
    FROM [dbo].[fn_PaginationData_Get](@PageIndex, @PageSize, @TotalRecords);

    SELECT 
        [EmailId],
        [Subject],
        [Recipients],
        [Body],
        [EmailStatusId],
        [Seen],
        [SendingAttempts],
        [CreationRecordMoment],
        [UpdateRecordMoment]
    FROM [dbo].[Email] WITH(NOLOCK)
    WHERE
        (@Subject IS NULL OR [Subject] LIKE '%' + @Subject + '%') AND
        (@Recipients IS NULL OR [Recipients] LIKE '%' + @Recipients + '%') AND
        (@EmailStatusId IS NULL OR [EmailStatusId] = @EmailStatusId) AND
        (@Seen IS NULL OR [Seen] = @Seen)
    ORDER BY [CreationRecordMoment] DESC
    OFFSET @Offset ROWS
    FETCH NEXT @Limit ROWS ONLY;
END
GO