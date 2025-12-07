CREATE TABLE [dbo].[UserToken] (
    [UserTokenId]          BIGINT IDENTITY(1,1) NOT NULL,
    [UserId]               BIGINT               NOT NULL,
    [TokenTypeId]          TINYINT              NOT NULL,
    [Token]                VARCHAR(255)         NOT NULL,
    [ExpirationDate]       DATETIME2(0)         NOT NULL,
    [DeviceInfo]           VARCHAR(255)         NULL,
    [CreatedByIp]          VARCHAR(45)          NULL,
    [Revoked]              BIT                  NOT NULL DEFAULT 0,
    [ReplacedByTokenId]    BIGINT               NULL, 
    [CreationRecordMoment] DATETIME2(0)         NOT NULL DEFAULT SYSUTCDATETIME(),
    [UpdateRecordMoment] DATETIME2(0)         NULL
    CONSTRAINT [PK_UserToken] PRIMARY KEY CLUSTERED ([UserTokenId] ASC),
    CONSTRAINT [FK_UserToken_User] FOREIGN KEY ([UserId]) REFERENCES [dbo].[User] ([UserId]) ON DELETE CASCADE,
    CONSTRAINT [FK_UserToken_TokenType] FOREIGN KEY ([TokenTypeId]) REFERENCES [dbo].[TokenType] ([TokenTypeId]),
    CONSTRAINT [FK_UserToken_ReplacedBy] FOREIGN KEY ([ReplacedByTokenId]) REFERENCES [dbo].[UserToken] ([UserTokenId])
);
GO

CREATE UNIQUE INDEX [IX_UserToken_Token] ON [dbo].[UserToken] ([Token]);
GO

CREATE INDEX [IX_UserToken_User] ON [dbo].[UserToken] ([UserId]);