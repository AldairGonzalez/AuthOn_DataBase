CREATE FUNCTION [dbo].[fn_SplitBit] (
    @List VARCHAR(MAX),
    @Delimiter VARCHAR(10)
)
RETURNS TABLE
AS
    RETURN (
        SELECT TRY_CAST(Value AS BIT) AS Value
        FROM STRING_SPLIT(@List, @Delimiter)
        WHERE TRY_CAST(Value AS INT) IN (0, 1)
    );