CREATE PROCEDURE [dbo].[sp_UserToken_List]
    @TokenTypeId VARCHAR(MAX) = NULL,
    @UserId BIGINT = NULL,
    @IsUsed VARCHAR(MAX) = NULL,
    @Revoked VARCHAR(MAX) = NULL,
    @PageIndex INT = NULL,
    @PageSize INT = NULL
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @TableTokenType TABLE (TokenTypeId TINYINT);
    DECLARE @TableIsUsed TABLE (IsUsed BIT);
    DECLARE @TableRevoked TABLE (Revoked BIT);
    DECLARE @TableTotalRecords TABLE (TotalRecords INT);
    DECLARE @TotalRecords INT;
    DECLARE @Offset INT;
    DECLARE @Limit INT;

    INSERT INTO @TableTotalRecords (TotalRecords) EXEC [dbo].[sp_UserToken_Count]
        @TokenTypeId = @TokenTypeId,
        @UserId = @UserId,
        @IsUsed = @IsUsed,
        @Revoked = @Revoked;

    SELECT @TotalRecords = TotalRecords FROM @TableTotalRecords;

    SELECT @Offset = Offset, 
           @Limit = Limit 
    FROM [dbo].[fn_PaginationData_Get](@PageIndex, @PageSize, @TotalRecords);

    IF @TokenTypeId IS NOT NULL
        INSERT INTO @TableTokenType 
            SELECT * FROM [dbo].[fn_SplitTinyInt](@TokenTypeId, ',');

    IF @IsUsed IS NOT NULL
        INSERT INTO @TableIsUsed 
            SELECT * FROM [dbo].[fn_SplitBit](@IsUsed, ',');

    IF @Revoked IS NOT NULL
        INSERT INTO @TableRevoked
            SELECT * FROM [dbo].[fn_SplitBit](@Revoked, ',');

    SELECT *
    FROM [dbo].[UserToken]
    WHERE
        (@TokenTypeId IS NULL OR TokenTypeId IN (SELECT TokenTypeId FROM @TableTokenType)) AND
        (@UserId IS NULL OR UserId = @UserId) AND
        (@IsUsed IS NULL OR IsUsed IN (SELECT IsUsed FROM @TableIsUsed)) AND
        (@Revoked IS NULL OR Revoked IN (SELECT Revoked FROM @TableRevoked))
    ORDER BY UserTokenId
    OFFSET @Offset ROWS
    FETCH NEXT @Limit ROWS ONLY;
END