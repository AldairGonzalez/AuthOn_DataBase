CREATE PROCEDURE [dbo].[sp_UserTraceability_Create]
    @UserId        BIGINT,
    @PerformedById BIGINT = NULL,
    @TypeActionId  TINYINT,
    @IpAddress     VARCHAR(45) = NULL,
    @Observation   VARCHAR(500) = NULL
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO [dbo].[UserTraceability] (
        [UserId],
        [PerformedById],
        [TypeActionId],
        [IpAddress],
        [Observation]
    )
    VALUES (
        @UserId,
        @PerformedById,
        @TypeActionId,
        @IpAddress,
        @Observation
    );

    SELECT CAST(SCOPE_IDENTITY() AS BIGINT);
END
GO