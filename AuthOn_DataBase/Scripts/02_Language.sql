MERGE INTO [dbo].[Language] AS Target
USING (VALUES
    (1, 'es-CO'),
    (2, 'pt-BR'),
    (3, 'fr-FR'),
    (4, 'en-US')
) AS Source ([LanguageId], [Code])
ON (Target.[LanguageId] = Source.[LanguageId])
WHEN MATCHED THEN
    UPDATE SET Target.[Code] = Source.[Code]
WHEN NOT MATCHED BY TARGET THEN
    INSERT ([LanguageId], [Code]) VALUES (Source.[LanguageId], Source.[Code]);