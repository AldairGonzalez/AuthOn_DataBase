CREATE PROCEDURE [dbo].[sp_Product_Update_Status]
    @ProductId BIGINT,
    @IsActive  BIT
AS
BEGIN
    UPDATE [dbo].[Product]
    SET 
        [IsActive] = @IsActive,
        [UpdateRecordMoment] = SYSUTCDATETIME()
    WHERE [ProductId] = @ProductId;
END
GO