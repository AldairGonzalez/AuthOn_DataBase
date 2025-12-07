CREATE TABLE [dbo].[TypeLogHistory] (
    [TypeLogHistoryId]  TINYINT     NOT NULL,
    [Code]              VARCHAR(50) NOT NULL,
    CONSTRAINT [PK_TypeLogHistory] PRIMARY KEY CLUSTERED ([TypeLogHistoryId] ASC),
    CONSTRAINT [UQ_TypeLogHistory_Code] UNIQUE ([Code])
);