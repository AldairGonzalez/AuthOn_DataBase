CREATE FUNCTION [dbo].[fn_SplitInt] (
    @List VARCHAR(MAX),
    @Delimiter VARCHAR(10)
)
RETURNS TABLE
AS
    RETURN (
        SELECT TRY_CAST(Value AS INT) AS Value
        FROM STRING_SPLIT(@List, @Delimiter)
        WHERE TRY_CAST(Value AS INT) IS NOT NULL
    );