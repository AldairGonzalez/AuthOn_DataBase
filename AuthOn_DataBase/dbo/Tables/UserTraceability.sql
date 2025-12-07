CREATE TABLE [dbo].[UserTraceability] (
    [UserTraceabilityId]   BIGINT IDENTITY(1,1) NOT NULL,
    [UserId]               BIGINT               NOT NULL,
    [PerformedById]        BIGINT               NULL,
    [TypeActionId]         TINYINT              NOT NULL,
    [IpAddress]            VARCHAR(45)          NULL, 
    [Observation]          VARCHAR(500)        NULL,
    [CreationRecordMoment] DATETIME2(0)         NOT NULL DEFAULT SYSUTCDATETIME(),
    CONSTRAINT [PK_UserTraceability] PRIMARY KEY CLUSTERED ([UserTraceabilityId] ASC),
    CONSTRAINT [FK_UserTraceability_User] FOREIGN KEY ([UserId]) REFERENCES [dbo].[User] ([UserId]),
    CONSTRAINT [FK_UserTraceability_PerformedBy] FOREIGN KEY ([PerformedById]) REFERENCES [dbo].[User] ([UserId]),
    CONSTRAINT [FK_UserTraceability_TypeAction] FOREIGN KEY ([TypeActionId]) REFERENCES [dbo].[TypeAction] ([TypeActionId])
);
GO

CREATE INDEX [IX_UserTraceability_User] ON [dbo].[UserTraceability] ([UserId]);
GO

CREATE INDEX [IX_UserTraceability_PerformedBy] ON [dbo].[UserTraceability] ([PerformedById]) WHERE [PerformedById] IS NOT NULL;