CREATE PROCEDURE [dbo].[sp_UserToken_Count]
    @TokenTypeId VARCHAR(MAX) = NULL,
    @UserId BIGINT = NULL,
    @IsUsed VARCHAR(MAX) = NULL,
    @Revoked VARCHAR(MAX) = NULL
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @TableTokenType TABLE (TokenTypeId TINYINT);
    DECLARE @TableIsUsed TABLE (IsUsed BIT);
    DECLARE @TableRevoked TABLE (Revoked BIT);

    IF @TokenTypeId IS NOT NULL
        INSERT INTO @TableTokenType 
            SELECT * FROM [dbo].[fn_SplitTinyInt](@TokenTypeId, ',');

    IF @IsUsed IS NOT NULL
        INSERT INTO @TableIsUsed 
            SELECT * FROM [dbo].[fn_SplitBit](@IsUsed, ',');

    IF @Revoked IS NOT NULL
        INSERT INTO @TableRevoked
            SELECT * FROM [dbo].[fn_SplitBit](@Revoked, ',');

    SELECT COUNT(*)
    FROM [dbo].[UserToken]
    WHERE
        (@TokenTypeId IS NULL OR TokenTypeId IN (SELECT TokenTypeId FROM @TableTokenType)) AND
        (@UserId IS NULL OR UserId = @UserId) AND
        (@IsUsed IS NULL OR IsUsed IN (SELECT IsUsed FROM @TableIsUsed)) AND
        (@Revoked IS NULL OR Revoked IN (SELECT Revoked FROM @TableRevoked));
END