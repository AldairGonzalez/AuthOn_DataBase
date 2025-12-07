CREATE TABLE [dbo].[LogHistory] (
    [LogHistoryId]         BIGINT IDENTITY(1,1) NOT NULL,
    [TypeLogHistoryId]     TINYINT              NOT NULL,
    [UserActionId]         BIGINT               NOT NULL,
    [Description]          VARCHAR(MAX)         NOT NULL,
    [Url]                  VARCHAR(2048)        NOT NULL,
    [ProductId]            BIGINT               NULL,
    [CreationRecordMoment] DATETIME2(0)         NOT NULL DEFAULT SYSUTCDATETIME(),
    CONSTRAINT [PK_LogHistory] PRIMARY KEY CLUSTERED ([LogHistoryId] ASC),
    CONSTRAINT [FK_LogHistory_TypeLogHistory] FOREIGN KEY ([TypeLogHistoryId]) REFERENCES [dbo].[TypeLogHistory] ([TypeLogHistoryId]),
    CONSTRAINT [FK_LogHistory_User] FOREIGN KEY ([UserActionId]) REFERENCES [dbo].[User] ([UserId]),
    CONSTRAINT [FK_LogHistory_Product] FOREIGN KEY ([ProductId]) REFERENCES [dbo].[Product] ([ProductId])
);
GO

CREATE INDEX [IX_LogHistory_User] ON [dbo].[LogHistory] ([UserActionId]);
GO

CREATE INDEX [IX_LogHistory_Date] ON [dbo].[LogHistory] ([CreationRecordMoment]);