CREATE PROCEDURE [dbo].[sp_Product_Update]
    @ProductId  BIGINT,
    @Name       NVARCHAR(100),
    @UrlHome    VARCHAR(2048),
    @ApiKey     VARCHAR(100),
    @IsActive   BIT
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE [dbo].[Product]
    SET
        [Name]               = @Name,
        [UrlHome]            = @UrlHome,
        [ApiKey]             = @ApiKey,
        [IsActive]           = @IsActive,
        [UpdateRecordMoment] = SYSUTCDATETIME()
    WHERE [ProductId] = @ProductId;

    SELECT @@ROWCOUNT;
END
GO