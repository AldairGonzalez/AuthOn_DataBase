CREATE PROCEDURE [dbo].[GetNumberRecordsUserTokens](
	@tokenTypeId VARCHAR(10) = NULL,
	@isUsed VARCHAR(10) = NULL,
	@revoked VARCHAR(10) = NULL
)
AS
BEGIN
	
	DECLARE @tableTokenType TABLE (TokenTypeId TINYINT);
	DECLARE @tableIsUsed TABLE (IsUsed BIT);
	DECLARE @tableRevoked TABLE (Revoked BIT);

	INSERT INTO @tableTokenType 
		SELECT * FROM [dbo].[SplitTinyInt] (@tokenTypeId, ',')

	INSERT INTO @tableIsUsed 
		SELECT * FROM [dbo].[SplitBit] (@isUsed, ',')

	INSERT INTO @tableRevoked
		SELECT * FROM [dbo].[SplitBit] (@revoked, ',')

	SELECT COUNT(*)
	FROM [dbo].[UserToken]
	WHERE
		(@tokenTypeId IS NULL OR TokenTypeId IN (SELECT TokenTypeId FROM @tableTokenType)) AND
		(@isUsed IS NULL OR IsUsed IN (SELECT IsUsed FROM @tableIsUsed)) AND
		(@revoked IS NULL OR Revoked IN (SELECT Revoked FROM @tableRevoked)) 
END