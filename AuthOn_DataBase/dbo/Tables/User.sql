CREATE TABLE [dbo].[User] (
    [UserId]                        BIGINT IDENTITY(1,1)    NOT NULL,
    [UserName]                      NVARCHAR(50)            NOT NULL,
    [Email]                         NVARCHAR(255)           NOT NULL,
    [PasswordHash]                  NVARCHAR(255)           NOT NULL,
    [ChangePasswordOnNextSignIn]    BIT                     NOT NULL,
    [EmailConfirmed]                BIT                     NOT NULL,
    [AuthenticationAttempts]        TINYINT                 NOT NULL,
    [IsActive]                      BIT                     NOT NULL,
    [IsAdmin]                       BIT                     NOT NULL,
    [EliminationProcess]            BIT                     NOT NULL,
    [LanguageId]                    TINYINT                 NOT NULL,
    [CreationRecordMoment]          DATETIME2               NOT NULL,
    [UpdateRecordMoment]            DATETIME2                   NULL,
    CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED ([UserId] ASC),
    CONSTRAINT [UQ_User_Email] UNIQUE ([Email]),
    CONSTRAINT [FK_User_Language] FOREIGN KEY ([LanguageId]) REFERENCES [dbo].[Language] ([LanguageId])
);