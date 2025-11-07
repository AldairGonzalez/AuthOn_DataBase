CREATE TABLE [dbo].[TypeAction] (
    [TypeActionId]  TINYINT IDENTITY (1, 1) NOT NULL,
    [Code]          NVARCHAR (30)           NOT NULL,
    CONSTRAINT [PK_TypeAction] PRIMARY KEY CLUSTERED ([TypeActionId] ASC),
    CONSTRAINT [UQ_TypeAction_Code] UNIQUE ([Code])
);