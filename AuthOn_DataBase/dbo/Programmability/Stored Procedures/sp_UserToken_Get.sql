CREATE PROCEDURE [dbo].[sp_UserToken_Get]
    @UserTokenId BIGINT       = NULL,
    @Token       VARCHAR(255) = NULL
AS
BEGIN
    SET NOCOUNT ON;

    IF @UserTokenId IS NULL AND @Token IS NULL
    BEGIN
        RETURN;
    END

    SELECT TOP 1
        [UserTokenId],
        [UserId],
        [TokenTypeId],
        [Token],
        [ExpirationDate],
        [DeviceInfo],
        [CreatedByIp],
        [Revoked],
        [ReplacedByTokenId],
        [CreationRecordMoment],
        [UpdateRecordMoment]
    FROM [dbo].[UserToken] WITH(NOLOCK)
    WHERE 
        (@UserTokenId IS NOT NULL AND [UserTokenId] = @UserTokenId)
        OR
        (@Token IS NOT NULL AND [Token] = @Token);
END
GO