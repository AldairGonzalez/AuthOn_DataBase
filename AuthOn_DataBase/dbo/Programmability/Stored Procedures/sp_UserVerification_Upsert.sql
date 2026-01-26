CREATE PROCEDURE [dbo].[sp_UserVerification_Upsert]
    @UserId                 BIGINT,
    @SecurityCode           VARCHAR(6),
    @SecurityCodeExpiration DATETIME2(0)
AS
BEGIN
    MERGE INTO [dbo].[UserVerification] AS Target
    USING (VALUES (@UserId, @SecurityCode, @SecurityCodeExpiration)) 
    AS Source ([UserId], [SecurityCode], [Expiration])
    ON Target.[UserId] = Source.[UserId]
    
    WHEN MATCHED THEN
        UPDATE SET 
            [SecurityCode] = Source.[SecurityCode],
            [SecurityCodeExpiration] = Source.[Expiration],
            [LastSentAt] = SYSUTCDATETIME(),
            [FailedAttempts] = 0
            
    WHEN NOT MATCHED THEN
        INSERT ([UserId], [SecurityCode], [SecurityCodeExpiration], [LastSentAt], [FailedAttempts])
        VALUES (Source.[UserId], Source.[SecurityCode], Source.[Expiration], SYSUTCDATETIME(), 0);
END
GO