CREATE TABLE [dbo].[Email] (
    [EmailId]               BIGINT IDENTITY(1,1) NOT NULL,
    [Subject]               NVARCHAR(500)        NOT NULL, 
    [Recipients]            NVARCHAR(MAX)        NOT NULL, 
    [Body]                  NVARCHAR(MAX)        NOT NULL, 
    [EmailStatusId]         TINYINT              NOT NULL,
    [Seen]                  BIT                  NOT NULL DEFAULT 0,
    [SendingAttempts]       TINYINT              NOT NULL DEFAULT 0,
    [CreationRecordMoment]  DATETIME2(0)         NOT NULL DEFAULT SYSUTCDATETIME(), 
    [UpdateRecordMoment]    DATETIME2(0)         NULL,
    CONSTRAINT [PK_Email] PRIMARY KEY CLUSTERED ([EmailId] ASC),
    CONSTRAINT [FK_Email_EmailStatus] FOREIGN KEY ([EmailStatusId]) REFERENCES [dbo].[EmailStatus] ([EmailStatusId])
);