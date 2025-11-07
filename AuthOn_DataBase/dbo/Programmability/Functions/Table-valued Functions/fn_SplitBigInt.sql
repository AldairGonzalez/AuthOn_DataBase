CREATE FUNCTION [dbo].[fn_SplitBigInt] (
    @List VARCHAR(MAX),
    @Delimiter VARCHAR(10)
)
RETURNS TABLE
AS
    RETURN (
        SELECT TRY_CAST(Value AS BIGINT) AS Value
        FROM STRING_SPLIT(@List, @Delimiter)
        WHERE TRY_CAST(Value AS BIGINT) IS NOT NULL
    );