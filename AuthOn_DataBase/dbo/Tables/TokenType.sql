CREATE TABLE [dbo].[TokenType] (
    [TokenTypeId]       TINYINT     NOT NULL,
    [Code]              VARCHAR(50) NOT NULL,
    [DurationInMinutes] INT         NOT NULL,
    CONSTRAINT [PK_TokenType] PRIMARY KEY CLUSTERED ([TokenTypeId] ASC),
    CONSTRAINT [UQ_TokenType_Code] UNIQUE ([Code])
);