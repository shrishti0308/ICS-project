DROP DATABASE IF EXISTS sqli;
CREATE DATABASE sqli;

USE sqli;

DROP TABLE IF EXISTS Movie;
-- CREATE TABLE Movie
-- (
--     Id INT PRIMARY KEY IDENTITY(100, 1),
--     Title NVARCHAR(255) NOT NULL,
--     Genre NVARCHAR(255) NOT NULL,
--     Director NVARCHAR(255) NOT NULL,
--     ReleaseDate DATE NOT NULL,
--     RunningTime INT NOT NULL,
--     Price FLOAT NOT NULL,
--     Rated NVARCHAR(100) NOT NULL
-- );

-- For MariaDB, use the following:
CREATE TABLE Movie
(
    Id INT PRIMARY KEY AUTO_INCREMENT,
    Title NVARCHAR(255) NOT NULL,
    Genre NVARCHAR(255) NOT NULL,
    Director NVARCHAR(255) NOT NULL,
    ReleaseDate DATE NOT NULL,
    RunningTime INT NOT NULL,
    Price DECIMAL(10, 2) NOT NULL,
    Rated NVARCHAR(10) NOT NULL
);


DROP TABLE IF EXISTS Account;
-- CREATE TABLE Account
-- (
--     Id INT PRIMARY KEY IDENTITY(200, 1),
--     Email NVARCHAR(255) NOT NULL,
--     PasswordHash NVARCHAR(255) NOT NULL,
--     [Type] NVARCHAR(255) NOT NULL
-- );

-- For MariaDB, use the following:
CREATE TABLE Account
(
    Id INT PRIMARY KEY AUTO_INCREMENT,
    Email NVARCHAR(255) NOT NULL,
    PasswordHash NVARCHAR(255) NOT NULL,
    `Type` NVARCHAR(255) NOT NULL
);

INSERT INTO Movie
    (Title, Genre, Director, ReleaseDate, RunningTime, Price, Rated)
VALUES
    ('Shutter Island', 'Suspense/Thriller', 'Christopher Nolan', '2011-06-09', 140, 545, 'R'),
    ('Zootopia', 'Animation', 'Zach Berlin', '2016-05-18', 130, 650, 'PG'),
    ('John Wick 1', 'Action', 'Josh Martin', '2012-11-04', 130, 740, 'R'),
    ('Shrek', 'Animation/Comedy', 'Andrew Adamson', '2003-06-11', 120, 460, 'PG'),
    ('John Wick 2', 'Action', 'Josh Martin', '2016-06-16', 143, 899, 'R'),
    ('Thor', 'Action/Superhero', 'Kenneth Branagh', '2011-04-30', 120, 760, 'PG-13'),
    ('Toy Story', 'Animation/Family', 'John Lasseter', '1995-11-19', 110, 654, 'G'),
    ('The Terminator', 'Science Fiction/Action', 'James Cameron', '1984-10-26', 160, 689, 'R');

INSERT INTO Account
    (Email, PasswordHash, `Type`)
VALUES
    ('saad@gmail.com', SHA2('saadpassword', 512), 'Customer'),
    ('asad@gmail.com', SHA2('asadpassword', 512), 'Customer'),
    ('moiz@gmail.com', SHA2('adminpassword', 512), 'Admin'),
    ('yousuf@gmail.com', SHA2('yousufpassword', 512), 'Customer'),
    ('tahoor@gmail.com', SHA2('tahoorpassword', 512), 'Moderator');
