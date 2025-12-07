CREATE PROCEDURE [dbo].[sp_Product_Create]
    @Code       VARCHAR(50),
    @Name       NVARCHAR(100),
    @UrlHome    VARCHAR(2048) = NULL,
    @ApiKey     VARCHAR(100)  = NULL,
    @IsActive   BIT           = 1
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO [dbo].[Product] (
        [Code],
        [Name],
        [UrlHome],
        [ApiKey],
        [IsActive]
    )
    VALUES (
        @Code,
        @Name,
        @UrlHome,
        @ApiKey,
        @IsActive
    );

    SELECT CAST(SCOPE_IDENTITY() AS BIGINT);
END
GO