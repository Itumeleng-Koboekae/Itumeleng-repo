-- Create the database
CREATE DATABASE `AutoTest.db`;

-- Use the database
USE `AutoTest.db`;

-- Create the user table
CREATE TABLE user (
    Name VARCHAR(50),
    Surname VARCHAR(50),
    Email VARCHAR(100)
);

-- Create a stored procedure to insert data
DELIMITER //
CREATE PROCEDURE insert_user(IN name VARCHAR(50), IN surname VARCHAR(50), IN email VARCHAR(100))
BEGIN
    INSERT INTO user (Name, Surname, Email) VALUES (name, surname, email);
END //
DELIMITER ;

-- Create the Auto_user with full access
CREATE USER 'Auto_user'@'%' IDENTIFIED BY '@@AUTO_USER_PASSWORD@@';
GRANT ALL PRIVILEGES ON *.* TO 'Auto_user'@'%' WITH GRANT OPTION;

-- Insert sample data using the stored procedure
CALL insert_user('John', 'Doe', 'john@example.com');
CALL insert_user('Jane', 'Smith', 'jane@example.com');
