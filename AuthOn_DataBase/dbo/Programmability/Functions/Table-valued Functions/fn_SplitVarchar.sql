CREATE FUNCTION [dbo].[fn_SplitVarchar] (
    @List VARCHAR(MAX),
    @Delimiter VARCHAR(10)
)
RETURNS TABLE
AS
    RETURN (
        SELECT Value
        FROM STRING_SPLIT(@List, @Delimiter)
    );