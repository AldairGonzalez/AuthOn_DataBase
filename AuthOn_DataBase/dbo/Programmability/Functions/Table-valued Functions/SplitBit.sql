CREATE FUNCTION [dbo].[SplitBit]
(
	@list VARCHAR(MAX),
	@delimiter VARCHAR(10)
)
RETURNS TABLE
AS
	RETURN (SELECT TRY_CAST(value AS BIT) AS Value
			FROM STRING_SPLIT(@list, @delimiter)
			WHERE TRY_CAST(value AS INT) IN (0, 1));