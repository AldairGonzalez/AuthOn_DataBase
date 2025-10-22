CREATE TABLE [dbo].[User] (
    [UserId]                 BIGINT         IDENTITY (1, 1) NOT NULL,
    [UserName]               NVARCHAR (250) NOT NULL,
    [Email]                  NVARCHAR (250) NOT NULL,
    [PasswordHash]           NVARCHAR (255) NOT NULL,
    [PasswordSalt]           NVARCHAR (255) NOT NULL,
    [ChangePassword]         BIT            NOT NULL,
    [EmailConfirmed]         BIT            NOT NULL,
    [AuthenticationAttempts] TINYINT        NOT NULL,
    [IsActive]               BIT            NOT NULL,
    [IsAdmin]                BIT            NOT NULL,
    [EliminationProcess]     BIT            NOT NULL,
    [LanguageId]             TINYINT        NOT NULL,
    [CreationRecordMoment]   DATETIME       NOT NULL,
    [UpdateRecordMoment]     DATETIME       NULL,
    CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED ([UserId] ASC),
    CONSTRAINT [FK_User_Language] FOREIGN KEY ([LanguageId]) REFERENCES [dbo].[Language] ([LanguageId])
);

