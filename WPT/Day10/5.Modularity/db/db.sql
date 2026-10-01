CREATE DATABASE cpac_db;

USE cpac_db;

CREATE TABLE products(
    pid INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(30),
    price DECIMAL(7,2)
);

INSERT INTO products(name,price) VALUES('Pen',20);
INSERT INTO products(name,price) VALUES('Pencil',10);
INSERT INTO products(name,price) VALUES('Book',50);

CREATE TABLE users(
    uid INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(20),
    email VARCHAR(50),
    password VARCHAR(100),
    mobile CHAR(10)
);