MERGE INTO [dbo].[TokenType] AS Target
USING (VALUES
    (1, 'REFRESH_TOKEN', 10080),
    (2, 'PASSWORD_RECOVERY', 30)
) AS Source ([TokenTypeId], [Code], [DurationInMinutes])
ON (Target.[TokenTypeId] = Source.[TokenTypeId])
WHEN MATCHED THEN
    UPDATE SET Target.[Code] = Source.[Code], Target.[DurationInMinutes] = Source.[DurationInMinutes]
WHEN NOT MATCHED BY TARGET THEN
    INSERT ([TokenTypeId], [Code], [DurationInMinutes]) VALUES (Source.[TokenTypeId], Source.[Code], Source.[DurationInMinutes]);