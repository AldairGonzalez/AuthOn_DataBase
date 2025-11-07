CREATE PROCEDURE [dbo].[sp_UserTraceability_Create]
    @UserId BIGINT,
    @PerformedById BIGINT = NULL,
    @TypeActionId TINYINT,
    @Moment DATETIME2,
    @IpAddress NVARCHAR(45) = NULL,
    @Observation NVARCHAR(MAX) = NULL
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO [dbo].[UserTraceability] (
        UserId,
        PerformedById,
        TypeActionId,
        Moment,
        IpAddress,
        Observation
    )
    VALUES (
        @UserId,
        @PerformedById,
        @TypeActionId,
        @Moment,
        @IpAddress,
        @Observation
    );

    SELECT SCOPE_IDENTITY();
END