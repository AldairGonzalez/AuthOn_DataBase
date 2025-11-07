CREATE FUNCTION [dbo].[fn_SplitTinyInt] (
    @List VARCHAR(MAX),
    @Delimiter VARCHAR(10)
)
RETURNS TABLE
AS
    RETURN (
        SELECT TRY_CAST(Value AS TINYINT) AS Value
        FROM STRING_SPLIT(@List, @Delimiter)
        WHERE TRY_CAST(Value AS INT) BETWEEN 0 AND 255
    );