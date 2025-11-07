CREATE TABLE [dbo].[Email] (
    [EmailId]               BIGINT IDENTITY(1,1)    NOT NULL,
    [Subject]               NVARCHAR(MAX)           NOT NULL,
    [Recipients]            NVARCHAR(MAX)           NOT NULL,
    [Body]                  NVARCHAR(MAX)           NOT NULL,
    [EmailStatusId]         TINYINT                 NOT NULL,
    [Seen]                  BIT                     NOT NULL,
    [CreationRecordMoment]  DATETIME2               NOT NULL,
    [UpdateRecordMoment]    DATETIME2                   NULL,
    CONSTRAINT [PK_Email] PRIMARY KEY CLUSTERED ([EmailId] ASC),
    CONSTRAINT [FK_Email_EmailStatus] FOREIGN KEY ([EmailStatusId]) REFERENCES [dbo].[EmailStatus] ([EmailStatusId])
);