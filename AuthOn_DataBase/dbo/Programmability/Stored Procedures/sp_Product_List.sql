CREATE PROCEDURE [dbo].[sp_Product_List]
    @Code      VARCHAR(50)   = NULL,
    @Name      NVARCHAR(100) = NULL,
    @IsActive  BIT           = NULL,
    @PageIndex INT           = NULL,
    @PageSize  INT           = NULL
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @TotalRecords INT
    DECLARE @CountResult TABLE (Total INT);

    INSERT INTO @CountResult EXEC [dbo].[sp_Product_Count] 
        @Code, @Name, @IsActive;
        
    SELECT @TotalRecords = Total FROM @CountResult;

    DECLARE @Offset INT, @Limit INT
    SELECT @Offset = Offset, @Limit = Limit 
    FROM [dbo].[fn_PaginationData_Get](@PageIndex, @PageSize, @TotalRecords);

    SELECT 
        [ProductId],
        [Code],
        [Name],
        [UrlHome],
        [ApiKey],
        [IsActive],
        [CreationRecordMoment],
        [UpdateRecordMoment]
    FROM [dbo].[Product] WITH(NOLOCK)
    WHERE
        (@Code IS NULL OR [Code] LIKE '%' + @Code + '%') AND
        (@Name IS NULL OR [Name] LIKE '%' + @Name + '%') AND
        (@IsActive IS NULL OR [IsActive] = @IsActive)
    ORDER BY [Name] ASC
    OFFSET @Offset ROWS
    FETCH NEXT @Limit ROWS ONLY
END
GO