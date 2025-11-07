CREATE TABLE [dbo].[Product] (
    [ProductId] BIGINT IDENTITY (1, 1)  NOT NULL,
    [Code]      NVARCHAR (30)           NOT NULL,
    CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED ([ProductId] ASC),
    CONSTRAINT [UQ_Product_Code] UNIQUE ([Code])
);