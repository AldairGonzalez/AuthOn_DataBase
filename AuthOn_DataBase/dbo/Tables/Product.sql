CREATE TABLE [dbo].[Product] (
    [ProductId]            BIGINT IDENTITY (1, 1) NOT NULL,
    [Code]                 VARCHAR (50)           NOT NULL, 
    [Name]                 NVARCHAR (100)         NOT NULL,
    [UrlHome]              VARCHAR (2048)         NULL, 
    [ApiKey]               VARCHAR (100)          NULL,
    [IsActive]             BIT                    NOT NULL DEFAULT 1,
    [CreationRecordMoment] DATETIME2(0)           NOT NULL DEFAULT SYSUTCDATETIME(),
    [UpdateRecordMoment]   DATETIME2(0)           NULL,
    CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED ([ProductId] ASC),
    CONSTRAINT [UQ_Product_Code] UNIQUE ([Code])
);