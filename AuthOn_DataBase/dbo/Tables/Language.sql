CREATE TABLE [dbo].[Language] (
    [LanguageId]    TINYINT IDENTITY (1, 1) NOT NULL,
    [Code]          NVARCHAR (30)           NOT NULL,
    CONSTRAINT [PK_Language] PRIMARY KEY CLUSTERED ([LanguageId] ASC),
    CONSTRAINT [UQ_Language_Code] UNIQUE ([Code])
);