CREATE TABLE [dbo].[TokenType] (
    [TokenTypeId]   TINYINT IDENTITY (1, 1) NOT NULL,
    [Code]          NVARCHAR (30)           NOT NULL,
    CONSTRAINT [PK_TokenType] PRIMARY KEY CLUSTERED ([TokenTypeId] ASC),
    CONSTRAINT [UQ_TokenType_Code] UNIQUE ([Code])
);