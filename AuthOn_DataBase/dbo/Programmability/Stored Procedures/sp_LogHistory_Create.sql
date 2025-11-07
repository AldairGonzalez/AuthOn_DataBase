CREATE PROCEDURE [dbo].[sp_LogHistory_Create]
    @Description NVARCHAR(MAX),
    @Url NVARCHAR(1000),
    @TypeLogHistoryId TINYINT,
    @UserActionId BIGINT,
    @ProductId BIGINT = NULL
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO [dbo].[LogHistory] (
        TypeLogHistoryId,
        UserActionId,
        [Description],
        [Url],
        ProductId
    )
    VALUES (
        @TypeLogHistoryId,
        @UserActionId,
        @Description,
        @Url,
        @ProductId
    );

    SELECT CAST(SCOPE_IDENTITY() AS BIGINT);
END