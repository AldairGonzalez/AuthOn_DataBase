CREATE TABLE [dbo].[Product] (
    [ProductId] INT           IDENTITY (1, 1) NOT NULL,
    [Name]      VARCHAR (250) NOT NULL,
    [Code]      VARCHAR (250) NOT NULL,
    CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED ([ProductId] ASC)
);

