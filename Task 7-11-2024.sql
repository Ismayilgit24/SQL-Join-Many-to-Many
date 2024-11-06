CREATE DATABASE Task
USE Task
CREATE TABLE Categories(
Id INT PRIMARY KEY,
Name VARCHAR(25) NOT NULL
)

CREATE TABLE Products(
Id INT PRIMARY KEY IDENTITY,
Name VARCHAR(25) NOT NULL,
Price DECIMAL(6,2),
Cost DECIMAL(6,2),
CategoryId INT FOREIGN KEY REFERENCES Categories(Id)
)

INSERT INTO Categories (Id, [Name]) 
VALUES 
(1, 'Apple'), 
(2, 'Samsung'), 
(3, 'Nokia')

INSERT INTO Products ([Name], Price, Cost, CategoryId) 
VALUES ('iPhone 13', 3500, 2500, 1), 
('Samsung S23', 650, 500, 2), 
('Xiomi 14 Ultra', 250, 200, 2), 
('Nokia 6300', 30, 25, 3)

SELECT p.Name AS Products, c.Name AS Categories FROM Products AS p
JOIN Categories AS c
ON p.CategoryId = c.Id

CREATE TABLE Colors(
Id INT PRIMARY KEY IDENTITY,
[Name] VARCHAR(25) NOT NULL,
)
INSERT INTO Colors ([Name]) 
VALUES
('Black'), 
('Red'), 
('Blue'), 
('Aqua');

CREATE TABLE ProductsColors(
ProductsId INT FOREIGN KEY REFERENCES Products(Id),
ColorsId INT FOREIGN KEY REFERENCES Colors(Id),
)
INSERT INTO ProductsColors (ProductsId, ColorsId) 
VALUES 
(1, 1), 
(1, 2), 
(2, 3), 
(3, 4), 
(4, 1)

SELECT p.Name AS [Product Name], c.Name AS [Color Name], cs.Name [Catergory] FROM Products AS p
JOIN ProductsColors AS pc
ON p.Id = pc.ProductsId
JOIN Categories AS cs
ON p.CategoryId = cs.Id
JOIN Colors AS c
ON c.Id = pc.ColorsId