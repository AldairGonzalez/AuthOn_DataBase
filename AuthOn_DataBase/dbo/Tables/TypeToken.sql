CREATE TABLE [dbo].[TypeToken] (
    [TypeTokenId] TINYINT       IDENTITY (1, 1) NOT NULL,
    [Name]        VARCHAR (250) NOT NULL,
    [Description] VARCHAR (MAX) NULL,
    [Code]        VARCHAR (30)  NOT NULL,
    CONSTRAINT [PK_TypeToken] PRIMARY KEY CLUSTERED ([TypeTokenId] ASC)
);

