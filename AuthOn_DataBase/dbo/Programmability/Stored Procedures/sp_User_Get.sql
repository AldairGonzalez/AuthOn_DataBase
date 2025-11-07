CREATE PROCEDURE [dbo].[sp_User_Get]
    @UserId BIGINT = NULL,
    @Email NVARCHAR(255) = NULL
AS
BEGIN
    SET NOCOUNT ON;

    SELECT *
    FROM [dbo].[User]
    WHERE (@UserId IS NULL OR UserId = @UserId) AND
          (@Email IS NULL OR Email = @Email);
END