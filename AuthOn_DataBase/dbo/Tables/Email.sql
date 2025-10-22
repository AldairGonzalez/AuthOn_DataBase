CREATE TABLE [dbo].[Email] (
    [EmailId]              BIGINT        IDENTITY (1, 1) NOT NULL,
    [Subject]              VARCHAR (MAX) NOT NULL,
    [To]                   VARCHAR (MAX) NOT NULL,
    [Body]                 VARCHAR (MAX) NOT NULL,
    [EmailStatusId]        TINYINT       NOT NULL,
    [Seen]                 BIT           NOT NULL,
    [CreationRecordMoment] DATETIME      NOT NULL,
    [UpdateRecordMoment]   DATETIME      NULL,
    CONSTRAINT [PK_Email] PRIMARY KEY CLUSTERED ([EmailId] ASC),
    CONSTRAINT [FK_Email_EmailStatus] FOREIGN KEY ([EmailStatusId]) REFERENCES [dbo].[EmailStatus] ([EmailStatusId])
);

