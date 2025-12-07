CREATE TABLE [dbo].[EmailStatus] (
    [EmailStatusId] TINYINT     NOT NULL, 
    [Code]          VARCHAR(50) NOT NULL, 
    CONSTRAINT [PK_EmailStatus] PRIMARY KEY CLUSTERED ([EmailStatusId] ASC),
    CONSTRAINT [UQ_EmailStatus_Code] UNIQUE ([Code])
);