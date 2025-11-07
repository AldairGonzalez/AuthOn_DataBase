CREATE TABLE [dbo].[UserTraceability] (
    [UserTraceabilityId]    BIGINT IDENTITY(1,1)    NOT NULL,
    [UserId]                BIGINT                  NOT NULL,
    [PerformedById]           BIGINT                      NULL,
    [TypeActionId]          TINYINT                 NOT NULL,
    [Moment]                DATETIME2               NOT NULL,
    [IpAddress]             NVARCHAR(45)                NULL,
    [Observation]           NVARCHAR(MAX)               NULL,
    CONSTRAINT [PK_UserTraceability] PRIMARY KEY CLUSTERED ([UserTraceabilityId] ASC),
    CONSTRAINT [FK_UserTraceability_User] FOREIGN KEY ([UserId]) REFERENCES [dbo].[User] ([UserId]),
    CONSTRAINT [FK_UserTraceability_PerformedBy] FOREIGN KEY ([PerformedById]) REFERENCES [dbo].[User] ([UserId]),
    CONSTRAINT [FK_UserTraceability_TypeAction] FOREIGN KEY ([TypeActionId]) REFERENCES [dbo].[TypeAction] ([TypeActionId])
);