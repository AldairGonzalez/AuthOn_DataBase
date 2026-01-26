CREATE PROCEDURE [dbo].[sp_Product_Update_Info]
    @ProductId BIGINT,
    @Name      NVARCHAR(100),
    @UrlHome   VARCHAR(2048)
AS
BEGIN
    UPDATE [dbo].[Product]
    SET 
        [Name] = @Name,
        [UrlHome] = @UrlHome,
        [UpdateRecordMoment] = SYSUTCDATETIME()
    WHERE [ProductId] = @ProductId;
END
GO