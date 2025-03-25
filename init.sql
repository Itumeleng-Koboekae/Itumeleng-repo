CREATE PROCEDURE dbo.SetupAutoDB
AS
BEGIN
    -- Create Database if it doesn’t exist
    IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'AutoDB')
    BEGIN
        CREATE DATABASE AutoDB;
    END

    -- Switch to the new database
    USE AutoDB;

    -- Create Table if it doesn’t exist
    IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Users')
    BEGIN
        CREATE TABLE Users (
            Id INT PRIMARY KEY IDENTITY(1,1),
            Name NVARCHAR(100),
            Email NVARCHAR(100)
        );
    END

    -- Insert Sample Data
    INSERT INTO Users (Name, Email)
    VALUES ('John Doe', 'john@example.com'),
           ('Jane Smith', 'jane@example.com');
END
GO
