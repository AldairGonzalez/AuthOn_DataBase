CREATE PROCEDURE [dbo].[sp_UserToken_Create]
    @UserId         BIGINT,
    @TokenTypeId    TINYINT,
    @Token          VARCHAR(255),
    @ExpirationDate DATETIME2(0),
    @DeviceInfo     VARCHAR(255) = NULL,
    @CreatedByIp    VARCHAR(45)  = NULL
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO [dbo].[UserToken] (
        [UserId],
        [TokenTypeId],
        [Token],
        [ExpirationDate],
        [DeviceInfo],
        [CreatedByIp]
    )
    VALUES (
        @UserId,
        @TokenTypeId,
        @Token,
        @ExpirationDate,
        @DeviceInfo,
        @CreatedByIp
    );

    SELECT CAST(SCOPE_IDENTITY() AS BIGINT);
END
GO