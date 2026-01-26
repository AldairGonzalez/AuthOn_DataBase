CREATE PROCEDURE [dbo].[sp_Product_Update_ApiKey]
    @ProductId BIGINT,
    @ApiKey    VARCHAR(100)
AS
BEGIN
    UPDATE [dbo].[Product]
    SET 
        [ApiKey] = @ApiKey,
        [UpdateRecordMoment] = SYSUTCDATETIME()
    WHERE [ProductId] = @ProductId;
END
GO