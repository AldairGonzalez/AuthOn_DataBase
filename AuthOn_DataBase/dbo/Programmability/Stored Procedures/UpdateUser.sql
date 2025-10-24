CREATE PROCEDURE [dbo].[UpdateUser] (
	@userId BIGINT,
	@userName NVARCHAR(50),
	@email NVARCHAR(255),
	@passwordHash NVARCHAR(255),
	@passwordSalt NVARCHAR(255),
	@changePassword BIT,
	@emailConfirmed BIT,
	@authenticationAttempts TINYINT,
	@isActive BIT,
	@isAdmin BIT,
	@eliminationProcess BIT,
	@languageId TINYINT
)
AS
BEGIN
	UPDATE [dbo].[User]
	SET
		UserName = @userName,
		Email = @email,
		PasswordHash = @passwordHash,
		PasswordSalt = @passwordSalt,
		ChangePassword = @changePassword,
		EmailConfirmed = @emailConfirmed,
		AuthenticationAttempts = @authenticationAttempts,
		IsActive = @isActive,
		IsAdmin = @isAdmin,
		EliminationProcess = @eliminationProcess,
		LanguageId = @languageId,
		UpdateRecordMoment = SYSUTCDATETIME()
	WHERE
		UserId = @userId
END