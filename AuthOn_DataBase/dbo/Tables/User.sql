CREATE TABLE [dbo].[User] (
    [UserId]                     BIGINT IDENTITY(1,1) NOT NULL,
    [UserName]                   NVARCHAR(100)        NOT NULL,
    [Email]                      NVARCHAR(255)        NOT NULL,
    [PasswordHash]               VARCHAR(255)         NOT NULL,
    [ChangePasswordOnNextSignIn] BIT                  NOT NULL DEFAULT 0,
    [EmailConfirmed]             BIT                  NOT NULL DEFAULT 0,
    [AuthenticationAttempts]     TINYINT              NOT NULL DEFAULT 0,
    [IsActive]                   BIT                  NOT NULL DEFAULT 0,
    [IsAdmin]                    BIT                  NOT NULL DEFAULT 0,
    [EliminationProcess]         BIT                  NOT NULL DEFAULT 0,
    [TwoFactorEnabled]           BIT                  NOT NULL DEFAULT 0, 
    [LanguageId]                 TINYINT              NOT NULL,
    [CreationRecordMoment]       DATETIME2(0)         NOT NULL DEFAULT SYSUTCDATETIME(),
    [UpdateRecordMoment]         DATETIME2(0)         NULL,
    CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED ([UserId] ASC),
    CONSTRAINT [UQ_User_Email] UNIQUE ([Email]),
    CONSTRAINT [UQ_User_UserName] UNIQUE ([UserName]),
    CONSTRAINT [FK_User_Language] FOREIGN KEY ([LanguageId]) REFERENCES [dbo].[Language] ([LanguageId])
);
GO

CREATE INDEX [IX_User_IsActive] ON [dbo].[User] ([IsActive]);