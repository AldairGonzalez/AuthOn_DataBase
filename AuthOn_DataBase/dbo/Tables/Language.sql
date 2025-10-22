CREATE TABLE [dbo].[Language] (
    [LanguageId] TINYINT       IDENTITY (1, 1) NOT NULL,
    [Initials]   VARCHAR (20)  NOT NULL,
    [Name]       VARCHAR (250) NOT NULL,
    [IsDefault]  BIT           NOT NULL,
    CONSTRAINT [PK_Language] PRIMARY KEY CLUSTERED ([LanguageId] ASC)
);

