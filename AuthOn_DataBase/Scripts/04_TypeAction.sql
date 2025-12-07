MERGE INTO [dbo].[TypeAction] AS Target
USING (VALUES
    (1, 'USER_REGISTERED'),
    (2, 'ACCOUNT_ACTIVATED'),
    (3, 'LOGIN_SUCCESS'),
    (4, 'LOGIN_FAILED'),
    (5, 'LOGOUT'),
    (6, 'PASSWORD_CHANGED'),
    (7, 'PROFILE_UPDATED'),
    (8, 'TOKEN_REFRESHED')
) AS Source ([TypeActionId], [Code])
ON (Target.[TypeActionId] = Source.[TypeActionId])
WHEN MATCHED THEN
    UPDATE SET Target.[Code] = Source.[Code]
WHEN NOT MATCHED BY TARGET THEN
    INSERT ([TypeActionId], [Code]) VALUES (Source.[TypeActionId], Source.[Code]);