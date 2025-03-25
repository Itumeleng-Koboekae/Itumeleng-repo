-- Create the database (SQLite creates it automatically when you use it)
-- Create the user table
CREATE TABLE IF NOT EXISTS user (
    Name TEXT NOT NULL,
    Surname TEXT NOT NULL,
    Email TEXT NOT NULL UNIQUE
);
