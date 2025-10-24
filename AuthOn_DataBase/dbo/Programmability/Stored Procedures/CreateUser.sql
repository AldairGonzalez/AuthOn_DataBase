CREATE PROCEDURE [dbo].[CreateUser] (
	@userName NVARCHAR(50),
	@email NVARCHAR(255),
	@passwordHash NVARCHAR(255),
	@passwordSalt NVARCHAR(255),
	@languageId TINYINT
)
AS
BEGIN
	INSERT INTO [dbo].[User]
	(
		UserName,
		Email,
		PasswordHash,
		PasswordSalt,
		LanguageId
	)
	VALUES
	(
		@userName,
		@email,
		@passwordHash,
		@passwordSalt,
		@languageId
	)
	SELECT CAST(SCOPE_IDENTITY() AS BIGINT)
END