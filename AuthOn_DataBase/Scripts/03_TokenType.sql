SET IDENTITY_INSERT [dbo].[TokenType] ON;

MERGE INTO [dbo].[TokenType] AS Target
USING (VALUES
    (1, 'ACCOUNT_ACTIVATION')
) AS Source ([TokenTypeId], [Code])
ON (Target.[TokenTypeId] = Source.[TokenTypeId])

WHEN MATCHED THEN
    UPDATE SET Target.[Code] = Source.[Code]

WHEN NOT MATCHED BY TARGET THEN
    INSERT ([TokenTypeId], [Code]) VALUES (Source.[TokenTypeId], Source.[Code]);

SET IDENTITY_INSERT [dbo].[TokenType] OFF;