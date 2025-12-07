CREATE TABLE [dbo].[Language] (
    [LanguageId]    TINYINT     NOT NULL,
    [Code]          VARCHAR(50) NOT NULL,
    CONSTRAINT [PK_Language] PRIMARY KEY CLUSTERED ([LanguageId] ASC),
    CONSTRAINT [UQ_Language_Code] UNIQUE ([Code])
);