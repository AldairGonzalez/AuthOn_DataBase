MERGE INTO [dbo].[TypeLogHistory] AS Target
USING (VALUES
    (1, 'INFO'),
    (2, 'WARNING'),
    (3, 'ERROR'),
    (4, 'CRITICAL')
) AS Source ([TypeLogHistoryId], [Code])
ON (Target.[TypeLogHistoryId] = Source.[TypeLogHistoryId])
WHEN MATCHED THEN
    UPDATE SET Target.[Code] = Source.[Code]
WHEN NOT MATCHED BY TARGET THEN
    INSERT ([TypeLogHistoryId], [Code]) VALUES (Source.[TypeLogHistoryId], Source.[Code]);