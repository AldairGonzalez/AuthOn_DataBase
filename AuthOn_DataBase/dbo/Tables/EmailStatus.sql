CREATE TABLE [dbo].[EmailStatus] (
    [EmailStatusId] TINYINT IDENTITY (1, 1) NOT NULL,
    [Code]          NVARCHAR (30)           NOT NULL,
    CONSTRAINT [PK_EmailStatus] PRIMARY KEY CLUSTERED ([EmailStatusId] ASC),
    CONSTRAINT [UQ_EmailStatus_Code] UNIQUE ([Code])
);