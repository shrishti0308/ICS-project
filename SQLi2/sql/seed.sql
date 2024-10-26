-- Create database
CREATE DATABASE sqli2;

-- Use the database
USE sqli2;

-- Create dogs table
CREATE TABLE
    dogs (
        id INT PRIMARY KEY AUTO_INCREMENT,
        name VARCHAR(255),
        fluffiness INT,
        fitness INT,
        boldness INT
    );

-- Create users table
CREATE TABLE
    users (
        id INT PRIMARY KEY AUTO_INCREMENT,
        username VARCHAR(255),
        password VARCHAR(255)
    );

-- Create preferences table
CREATE TABLE
    preferences (
        id INT PRIMARY KEY AUTO_INCREMENT,
        user_id INT,
        filter_column VARCHAR(255),
        filter_value INT
    );

-- Insert some dummy dogs
INSERT INTO
    dogs (name, fluffiness, fitness, boldness)
VALUES
    ('Buddy', 3, 2, 1),
    ('Charlie', 1, 3, 2),
    ('Max', 2, 1, 3),
    ('Bella', 2, 2, 2),
    ('Lucy', 3, 1, 1),
    ('Daisy', 1, 2, 3),
    ('Bailey', 3, 3, 1);

-- Insert some dummy users
INSERT INTO
    users (username, password)
VALUES
    ('admin', 'password123'),
    ('user1', 'user1pass'),
    ('user2', 'user2pass');

-- Insert some dummy preferences
INSERT INTO
    preferences (user_id, filter_column, filter_value)
VALUES
    (1, 'fluffiness', 3),
    (2, 'fitness', 2),
    (3, 'boldness', 1);
