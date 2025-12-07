CREATE TABLE [dbo].[TypeAction] (
    [TypeActionId]  TINYINT     NOT NULL,
    [Code]          VARCHAR(50) NOT NULL,
    CONSTRAINT [PK_TypeAction] PRIMARY KEY CLUSTERED ([TypeActionId] ASC),
    CONSTRAINT [UQ_TypeAction_Code] UNIQUE ([Code])
);