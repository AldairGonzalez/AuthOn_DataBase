CREATE TABLE [dbo].[UserVerification]
(
    [UserId]                 BIGINT        NOT NULL,
    [SecurityCode]           VARCHAR(6)    NULL,
    [SecurityCodeExpiration] DATETIME2(0)  NULL,
    [LastSentAt]             DATETIME2(0)  NULL,
    [FailedAttempts]         TINYINT       NOT NULL DEFAULT 0,
    CONSTRAINT [PK_UserVerification] PRIMARY KEY CLUSTERED ([UserId] ASC),
    CONSTRAINT [FK_UserVerification_User] FOREIGN KEY ([UserId]) REFERENCES [dbo].[User] ([UserId]) ON DELETE CASCADE
);
