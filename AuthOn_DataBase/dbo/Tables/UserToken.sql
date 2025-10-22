CREATE TABLE [dbo].[UserToken] (
    [UserTokenId]          BIGINT         IDENTITY (1, 1) NOT NULL,
    [UserId]               BIGINT         NOT NULL,
    [TypeTokenId]          TINYINT        NOT NULL,
    [Token]                NVARCHAR (MAX) NOT NULL,
    [IsUsed]               BIT            NOT NULL,
    [Revoked]              BIT            NOT NULL,
    [ExpirationDate]       DATETIME       NOT NULL,
    [CreationRecordMoment] DATETIME       NOT NULL,
    [UpdateRecordMoment]   DATETIME       NULL,
    CONSTRAINT [PK_UserToken] PRIMARY KEY CLUSTERED ([UserTokenId] ASC),
    CONSTRAINT [FK_UserToken_TypeToken] FOREIGN KEY ([TypeTokenId]) REFERENCES [dbo].[TypeToken] ([TypeTokenId]),
    CONSTRAINT [FK_UserToken_User] FOREIGN KEY ([UserId]) REFERENCES [dbo].[User] ([UserId])
);

