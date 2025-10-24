CREATE TABLE [dbo].[EmailStatus] (
    [EmailStatusId] TINYINT IDENTITY (1, 1) NOT NULL,
    [Name]          NVARCHAR (50)           NOT NULL,
    [Description]   NVARCHAR (MAX)              NULL,
    [Code]          NVARCHAR (30)           NOT NULL,
    CONSTRAINT [PK_EmailStatus] PRIMARY KEY CLUSTERED ([EmailStatusId] ASC),
    CONSTRAINT [UQ_EmailStatus_Code] UNIQUE ([Code])
);