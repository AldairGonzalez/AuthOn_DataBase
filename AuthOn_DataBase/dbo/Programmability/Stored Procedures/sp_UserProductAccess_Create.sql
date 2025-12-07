CREATE PROCEDURE [dbo].[sp_UserProductAccess_Create]
    @ProductId BIGINT,
    @UserId    BIGINT,
    @IsActive  BIT = 1
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO [dbo].[UserProductAccess] (
        [ProductId], 
        [UserId], 
        [IsActive]
    )
    VALUES (
        @ProductId, 
        @UserId, 
        @IsActive
    );

    SELECT CAST(SCOPE_IDENTITY() AS BIGINT);
END
GO