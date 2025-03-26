-- Create Database if it doesn't exist
IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'AutoDB')
BEGIN
    CREATE DATABASE AutoDB;
END
GO

-- Switch to AutoDB
USE AutoDB;
GO

-- Create or update Stored Procedure
IF OBJECT_ID('dbo.SetupAutoDB', 'P') IS NOT NULL
    DROP PROCEDURE dbo.SetupAutoDB;
GO

CREATE PROCEDURE dbo.SetupAutoDB
AS
BEGIN
    -- Create Table if it doesn't exist
    IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Users')
    BEGIN
        CREATE TABLE Users (
            Id INT PRIMARY KEY IDENTITY(1,1),
            Name NVARCHAR(100),
            Email NVARCHAR(100)
        );
    END
    -- Insert Sample Data only if not already present
    IF NOT EXISTS (SELECT 1 FROM Users WHERE Email = 'john@example.com')
    BEGIN
        INSERT INTO Users (Name, Email)
        VALUES ('John Doe', 'john@example.com');
    END
    IF NOT EXISTS (SELECT 1 FROM Users WHERE Email = 'jane@example.com')
    BEGIN
        INSERT INTO Users (Name, Email)
        VALUES ('Jane Smith', 'jane@example.com');
    END
END
GO

-- Execute the Stored Procedure
EXEC dbo.SetupAutoDB;
GO
