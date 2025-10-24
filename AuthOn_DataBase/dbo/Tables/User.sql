CREATE TABLE [dbo].[User] (
    [UserId]                    BIGINT IDENTITY(1,1)    NOT NULL,
    [UserName]                  NVARCHAR(50)            NOT NULL,
    [Email]                     NVARCHAR(255)           NOT NULL,
    [PasswordHash]              NVARCHAR(255)           NOT NULL,
    [PasswordSalt]              NVARCHAR(255)           NOT NULL,
    [ChangePassword]            BIT                     NOT NULL DEFAULT (0),
    [EmailConfirmed]            BIT                     NOT NULL DEFAULT (0),
    [AuthenticationAttempts]    TINYINT                 NOT NULL DEFAULT (0),
    [IsActive]                  BIT                     NOT NULL DEFAULT (0),
    [IsAdmin]                   BIT                     NOT NULL DEFAULT (0),
    [EliminationProcess]        BIT                     NOT NULL DEFAULT (0),
    [LanguageId]                TINYINT                 NOT NULL,
    [CreationRecordMoment]      DATETIME2               NOT NULL DEFAULT (SYSUTCDATETIME()),
    [UpdateRecordMoment]        DATETIME2                   NULL,
    CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED ([UserId] ASC),
    CONSTRAINT [UQ_User_Email] UNIQUE ([Email]),
    CONSTRAINT [FK_User_Language] FOREIGN KEY ([LanguageId]) REFERENCES [dbo].[Language] ([LanguageId])
);