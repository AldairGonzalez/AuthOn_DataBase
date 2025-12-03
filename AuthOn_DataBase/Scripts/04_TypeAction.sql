SET IDENTITY_INSERT [dbo].[TypeAction] ON;

MERGE INTO [dbo].[TypeAction] AS Target
USING (VALUES
    (4, 'USER_REGISTERED')
) AS Source ([TypeActionId], [Code])
ON (Target.[TypeActionId] = Source.[TypeActionId])

WHEN MATCHED THEN
    UPDATE SET Target.[Code] = Source.[Code]

WHEN NOT MATCHED BY TARGET THEN
    INSERT ([TypeActionId], [Code]) VALUES (Source.[TypeActionId], Source.[Code]);

SET IDENTITY_INSERT [dbo].[TypeAction] OFF;