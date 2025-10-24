CREATE TABLE [dbo].[UserToken] (
    [UserTokenId]           BIGINT IDENTITY(1,1)    NOT NULL,
    [UserId]                BIGINT                  NOT NULL,
    [TokenTypeId]           TINYINT                 NOT NULL,
    [Token]                 NVARCHAR(MAX)           NOT NULL,
    [IsUsed]                BIT                     NOT NULL DEFAULT (0),
    [Revoked]               BIT                     NOT NULL DEFAULT (0),
    [CreationRecordMoment]  DATETIME2               NOT NULL DEFAULT (SYSUTCDATETIME()),
    [UpdateRecordMoment]    DATETIME2                   NULL,
    CONSTRAINT [PK_UserToken] PRIMARY KEY CLUSTERED ([UserTokenId] ASC),
    CONSTRAINT [FK_UserToken_User] FOREIGN KEY ([UserId]) REFERENCES [dbo].[User] ([UserId]),
    CONSTRAINT [FK_UserToken_TokenType] FOREIGN KEY ([TokenTypeId]) REFERENCES [dbo].[TokenType] ([TokenTypeId])
);