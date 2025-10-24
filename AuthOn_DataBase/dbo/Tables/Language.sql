CREATE TABLE [dbo].[Language] (
    [LanguageId]    TINYINT IDENTITY (1, 1) NOT NULL,
    [Initials]      NVARCHAR (20)           NOT NULL,
    [Name]          NVARCHAR (50)           NOT NULL,
    [IsDefault]     BIT                     NOT NULL,
    CONSTRAINT [PK_Language] PRIMARY KEY CLUSTERED ([LanguageId] ASC),
    CONSTRAINT [UQ_Language_Initials] UNIQUE ([Initials])
);