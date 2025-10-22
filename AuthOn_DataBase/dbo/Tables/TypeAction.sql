CREATE TABLE [dbo].[TypeAction] (
    [TypeActionId] TINYINT       IDENTITY (1, 1) NOT NULL,
    [Name]         VARCHAR (250) NOT NULL,
    [Description]  VARCHAR (MAX) NULL,
    [Code]         VARCHAR (30)  NOT NULL,
    CONSTRAINT [PK_TypeAction] PRIMARY KEY CLUSTERED ([TypeActionId] ASC)
);

