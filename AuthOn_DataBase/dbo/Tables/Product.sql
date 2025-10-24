CREATE TABLE [dbo].[Product] (
    [ProductId]     BIGINT IDENTITY (1, 1)  NOT NULL,
    [Name]          NVARCHAR (50)           NOT NULL,
    [Description]   NVARCHAR (MAX)              NULL,
    [Code]          NVARCHAR (30)           NOT NULL,
    CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED ([ProductId] ASC),
    CONSTRAINT [UQ_Product_Code] UNIQUE ([Code])
);