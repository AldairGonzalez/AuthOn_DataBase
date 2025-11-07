CREATE TABLE [dbo].[UserProductAccess] (
    [UserProductAccessId]   BIGINT IDENTITY(1,1)    NOT NULL,
    [ProductId]             BIGINT                  NOT NULL,
    [UserId]                BIGINT                  NOT NULL,
    [IsActive]              BIT                     NOT NULL,
    [CreationRecordMoment]  DATETIME2               NOT NULL,
    [UpdateRecordMoment]    DATETIME2                   NULL,
    CONSTRAINT [PK_UserProductAccess] PRIMARY KEY CLUSTERED ([UserProductAccessId] ASC),
    CONSTRAINT [FK_UserProductAccess_Product] FOREIGN KEY ([ProductId]) REFERENCES [dbo].[Product] ([ProductId]),
    CONSTRAINT [FK_UserProductAccess_User] FOREIGN KEY ([UserId]) REFERENCES [dbo].[User] ([UserId])
);