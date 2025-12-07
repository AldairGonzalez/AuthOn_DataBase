CREATE PROCEDURE [dbo].[sp_UserToken_List]
    @TokenTypeId TINYINT = NULL,
    @UserId      BIGINT  = NULL,
    @Revoked     BIT     = NULL,
    @PageIndex   INT     = NULL,
    @PageSize    INT     = NULL
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @TotalRecords INT
    DECLARE @CountResult TABLE (Total INT);
    
    INSERT INTO @CountResult EXEC [dbo].[sp_UserToken_Count] 
        @TokenTypeId, @UserId, @Revoked;
        
    SELECT @TotalRecords = Total FROM @CountResult;

    DECLARE @Offset INT, @Limit INT
    SELECT @Offset = Offset, @Limit = Limit 
    FROM [dbo].[fn_PaginationData_Get](@PageIndex, @PageSize, @TotalRecords);

    SELECT *
    FROM [dbo].[UserToken] WITH(NOLOCK)
    WHERE
        (@TokenTypeId IS NULL OR [TokenTypeId] = @TokenTypeId) AND
        (@UserId IS NULL OR [UserId] = @UserId) AND
        (@Revoked IS NULL OR [Revoked] = @Revoked)
    ORDER BY [UserTokenId] DESC
    OFFSET @Offset ROWS
    FETCH NEXT @Limit ROWS ONLY;
END
GO