CREATE FUNCTION [dbo].[fn_PaginationData_Get] (
    @PageIndex INT = NULL,
    @PageSize INT = NULL,
    @TotalRecords INT
)
RETURNS @Result TABLE (
    Offset INT NOT NULL,
    Limit INT NOT NULL
)
AS
BEGIN
    DECLARE @Offset INT;
    DECLARE @Limit INT;
    
    SET @Offset =
    CASE 
        WHEN @PageIndex IS NOT NULL AND @PageSize IS NOT NULL
        THEN (@PageIndex - 1) * @PageSize
        ELSE 0
    END;
    
    SET @Limit =
    CASE
        WHEN @PageIndex IS NOT NULL AND @PageSize IS NOT NULL 
        THEN @PageSize
        ELSE IIF(@TotalRecords = 0, 1, @TotalRecords)
    END;
    
    INSERT INTO @Result (Offset, Limit) VALUES (@Offset, @Limit);
    RETURN;
END