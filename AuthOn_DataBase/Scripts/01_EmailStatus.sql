MERGE INTO [dbo].[EmailStatus] AS Target
USING (VALUES
    (1, 'PENDING'),
    (2, 'SENT'),
    (3, 'FAILED')
) AS Source ([EmailStatusId], [Code])
ON (Target.[EmailStatusId] = Source.[EmailStatusId])
WHEN MATCHED THEN
    UPDATE SET Target.[Code] = Source.[Code]
WHEN NOT MATCHED BY TARGET THEN
    INSERT ([EmailStatusId], [Code]) VALUES (Source.[EmailStatusId], Source.[Code]);