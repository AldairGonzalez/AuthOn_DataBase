CREATE TABLE [dbo].[TypeLogHistory] (
    [TypeLogHistoryId]  TINYINT IDENTITY (1, 1) NOT NULL,
    [Code]              NVARCHAR (30)           NOT NULL,
    CONSTRAINT [PK_TypeLogHistory] PRIMARY KEY CLUSTERED ([TypeLogHistoryId] ASC),
    CONSTRAINT [UQ_TypeLogHistory_Code] UNIQUE ([Code])
);