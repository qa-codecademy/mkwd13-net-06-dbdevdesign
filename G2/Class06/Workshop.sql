/* Create the database */

CREATE DATABASE PizzaDB
GO

USE PizzaDB
GO

/* Table Creation */

USE PizzaDB
GO

CREATE TABLE Toppings(
	Id int NOT NULL PRIMARY KEY CLUSTERED,
	Name nvarchar(255) NOT NULL,
	Price decimal(4, 2) NOT NULL 
)
GO


CREATE TABLE PizzaSizes(
	Id int NOT NULL PRIMARY KEY CLUSTERED,
	Name nvarchar(255) NOT NULL
)
GO

CREATE TABLE Orders(
	Id int NOT NULL PRIMARY KEY CLUSTERED,
	Price decimal(4, 2) NOT NULL,
	IsDelivered bit NOT NULL DEFAULT 0,
	UserId int NOT NULL
)
GO

CREATE TABLE Pizzas(
	Id int NOT NULL PRIMARY KEY CLUSTERED,
	Name nvarchar(255) NOT NULL,
	Price decimal(4, 2) NOT NULL,
	SizeId int NOT NULL,
	OrderId int NOT NULL,	
)
GO


CREATE TABLE PizzaToppings(
	Id int NOT NULL PRIMARY KEY CLUSTERED,
	PizzaId int NOT NULL,
	ToppingId int NOT NULL
) 
GO



CREATE TABLE Users(
	Id int NOT NULL PRIMARY KEY CLUSTERED,
	FirstName nvarchar(255) NOT NULL,
	LastName nvarchar(255) NOT NULL,
	Address nvarchar(255) NOT NULL,
	Phone nvarchar(255) NOT NULL
)
GO

/* Create relationships */

USE PizzaDB
GO

ALTER TABLE Orders ADD CONSTRAINT FK_Orders_Users FOREIGN KEY(UserId)
REFERENCES dbo.Users(Id)
GO

ALTER TABLE Pizzas ADD CONSTRAINT FK_Pizzas_PizzaSizes FOREIGN KEY(SizeId)
REFERENCES PizzaSizes(Id)

ALTER TABLE Pizzas ADD CONSTRAINT FK_Pizzas_Orders FOREIGN KEY(OrderId)
REFERENCES Orders(Id)
GO

ALTER TABLE PizzaToppings ADD CONSTRAINT FK_PizzaToppings_Pizzas FOREIGN KEY(PizzaId)
REFERENCES Pizzas(Id)
GO

ALTER TABLE PizzaToppings ADD  CONSTRAINT FK_PizzaToppings_Toppings FOREIGN KEY(ToppingId)
REFERENCES Toppings(Id)
GO

/* Data Inserts */

/* ------------------------------------------------------------------------ */

USE PizzaDB
GO

INSERT INTO Users(Id, FirstName, LastName, Address, Phone)
VALUES(1, 'Bob', 'Bobsky', 'Bob Street 22', '070111222')

INSERT INTO Users(Id, FirstName, LastName, Address, Phone)
VALUES(2, 'Jill', 'Wayne', 'Jill Street 22', '070222333')

INSERT INTO Users(Id, FirstName, LastName, Address, Phone)
VALUES(3, 'Greg', 'Gregsky', 'Greg Street 22', '070333444')

GO

/* ------------------------------------------------------------------------ */

USE PizzaDB
GO

INSERT INTO PizzaSizes(Id, Name)
VALUES(1, 'Small')

INSERT INTO PizzaSizes(Id, Name)
VALUES(2, 'Medium')

INSERT INTO PizzaSizes(Id, Name)
VALUES(3, 'Large')

INSERT INTO PizzaSizes(Id, Name)
VALUES(4, 'Family')

GO

/* ------------------------------------------------------------------------ */

INSERT INTO Orders(Id, Price, IsDelivered, UserId)
VALUES(1, 0.5, 1, 1)

INSERT INTO Orders(Id, Price, IsDelivered, UserId)
VALUES(2, 0.5, 1, 1)

INSERT INTO Orders(Id, Price, IsDelivered, UserId)
VALUES(3, 0.6, 0, 1)

INSERT INTO Orders(Id, Price, IsDelivered, UserId)
VALUES(4, 0.3, 0, 2)

INSERT INTO Orders(Id, Price, IsDelivered, UserId)
VALUES(5, 0.5, 1, 3)

/* ------------------------------------------------------------------------ */

USE PizzaDB
GO

/* Order 1 */
INSERT INTO Pizzas(Id, Name, SizeId, Price, OrderId)
VALUES(1, 'Capricciosa', 1, 2, 1)

INSERT INTO Pizzas(Id, Name, SizeId, Price, OrderId)
VALUES(2, 'Pepperoni', 3, 3.7, 1)

/* Order 2 */

INSERT INTO Pizzas(Id, Name, SizeId, Price, OrderId)
VALUES(3, 'Margarita', 1, 1.6, 2)

INSERT INTO Pizzas(Id, Name, SizeId, Price, OrderId)
VALUES(4, 'Seafood', 2, 2.9, 2)

INSERT INTO Pizzas(Id, Name, SizeId, Price, OrderId)
VALUES(5, 'Hawaiian', 2, 2.7, 2)

/* Order 3 */

INSERT INTO Pizzas(Id, Name, SizeId, Price, OrderId)
VALUES(6, 'Capricciosa', 2, 2.5, 3)

INSERT INTO Pizzas(Id, Name, SizeId, Price, OrderId)
VALUES(7, 'Pepperoni', 4, 4.8, 3)

INSERT INTO Pizzas(Id, Name, SizeId, Price, OrderId)
VALUES(8, 'Capricciosa', 3, 3.2, 3)

INSERT INTO Pizzas(Id, Name, SizeId, Price, OrderId)
VALUES(9, 'Hawaiian', 4, 5.2, 3)

/* Order 4 */

INSERT INTO Pizzas(Id, Name, SizeId, Price, OrderId)
VALUES(10, 'Capricciosa', 3, 3, 4)

/* Order 5 */

INSERT INTO Pizzas(Id, Name, SizeId, Price, OrderId)
VALUES(11, 'Margarita', 4, 4, 5)

INSERT INTO Pizzas(Id, Name, SizeId, Price, OrderId)
VALUES(12, 'Seafood', 3, 4.5, 5)

INSERT INTO Pizzas(Id, Name, SizeId, Price, OrderId)
VALUES(13, 'Pepperoni', 3, 4.2, 5)

INSERT INTO Pizzas(Id, Name, SizeId, Price, OrderId)
VALUES(14, 'Capricciosa', 4, 3.7, 5)

GO

/* ------------------------------------------------------------------------ */

INSERT INTO Toppings(Id, Name, Price)
VALUES(1, 'Cheese', 0.4)

INSERT INTO Toppings(Id, Name, Price)
VALUES(2, 'Mushrooms', 0.8)

INSERT INTO Toppings(Id, Name, Price)
VALUES(3, 'Bacon', 1)

INSERT INTO Toppings(Id, Name, Price)
VALUES(4, 'Onions', 0.2)

INSERT INTO Toppings(Id, Name, Price)
VALUES(5, 'Garlic', 0.3)

/* ------------------------------------------------------------------------ */

USE PizzaDB
GO

INSERT INTO PizzaToppings(Id, PizzaId, ToppingId)
VALUES(1, 1, 1)

INSERT INTO PizzaToppings(Id, PizzaId, ToppingId)
VALUES(2, 1, 3)

INSERT INTO PizzaToppings(Id, PizzaId, ToppingId)
VALUES(3, 2, 1)

INSERT INTO PizzaToppings(Id, PizzaId, ToppingId)
VALUES(4, 4, 3)

INSERT INTO PizzaToppings(Id, PizzaId, ToppingId)
VALUES(5, 4, 5)

INSERT INTO PizzaToppings(Id, PizzaId, ToppingId)
VALUES(6, 6, 1)

INSERT INTO PizzaToppings(Id, PizzaId, ToppingId)
VALUES(7, 7, 1)

INSERT INTO PizzaToppings(Id, PizzaId, ToppingId)
VALUES(8, 9, 2)

INSERT INTO PizzaToppings(Id, PizzaId, ToppingId)
VALUES(9, 10, 4)

INSERT INTO PizzaToppings(Id, PizzaId, ToppingId)
VALUES(10, 11, 1)

INSERT INTO PizzaToppings(Id, PizzaId, ToppingId)
VALUES(11, 11, 5)

INSERT INTO PizzaToppings(Id, PizzaId, ToppingId)
VALUES(12, 12, 4)

INSERT INTO PizzaToppings(Id, PizzaId, ToppingId)
VALUES(13, 14, 1)

INSERT INTO PizzaToppings(Id, PizzaId, ToppingId)
VALUES(14, 14, 2)

/* ------------------------------------------------------------------------ */

/* Extra Requirements */

/* There should be a function that concatenates First and Last Name of a user​ */

CREATE FUNCTION GetFullName(
	@firstName nvarchar(255),
	@lastName nvarchar(255)
)
RETURNS nvarchar(511)
AS
BEGIN
	RETURN @firstName + ' ' + @lastName
END
GO

SELECT dbo.GetFullName('Bob', 'Bobsky')

/* There should be a view to show all pizzas that are not delivered yet and the full names of the users waiting for them​ */

CREATE VIEW [Undelivered Pizzas] AS
	SELECT p.Name, p.SizeId, p.OrderId, dbo.GetFullName(u.FirstName, u.LastName) AS [User] FROM Pizzas AS p
	JOIN Orders AS o
	ON o.Id = p.OrderId
	JOIN Users AS u
	ON u.Id = o.UserId
	WHERE o.IsDelivered = 0
GO

SELECT * FROM [Undelivered Pizzas]

/* There should be a stored procedure that when provided an OrderId, can return the full price of a whole order ( Delivery + All Pizza + All Toppings )​ */

CREATE PROCEDURE GetFullPriceOfOrder @OrderId int
AS 
BEGIN
	DECLARE @pizzasPrice DECIMAL(4, 2)
	DECLARE @toppingsPrice DECIMAL(4, 2)
	DECLARE @orderPrice DECIMAL(4, 2)

	SELECT @pizzasPrice = SUM(p.Price), @toppingsPrice = SUM(t.Price) FROM Orders AS o
	JOIN Pizzas AS p
	ON o.Id = p.OrderId
	JOIN PizzaToppings AS pt
	ON p.Id = pt.PizzaId
	JOIN Toppings as t
	ON t.Id = pt.ToppingId
	WHERE o.Id = @OrderId

	SELECT @orderPrice = Price FROM Orders
	WHERE Id = @OrderId

	SELECT @OrderId AS [Order Id], @orderPrice AS [Order Price], @pizzasPrice AS [Pizzas Price], @toppingsPrice AS [Toppings Price], SUM(@pizzasPrice + @toppingsPrice + @orderPrice) AS [Full Price]
END
GO

EXEC dbo.GetFullPriceOfOrder @OrderId = 1

/* There should be a view that lists pizzas by the number of times ordered, starting from the most popular one ( Most times ordered )​ */

CREATE VIEW [Pizza Popularity] AS
	SELECT p.Name, COUNT(p.Name) AS [Number of times ordered] FROM Orders AS o
	JOIN Pizzas AS p
	ON o.Id = p.OrderId
	JOIN PizzaToppings AS pt
	ON p.Id = pt.PizzaId
	GROUP BY p.Name
GO

SELECT * FROM [Pizza Popularity]
ORDER BY [Number of times ordered] DESC

/* There should be a view that lists toppings by the number of times ordered, starting from the most popular one ( Most times ordered )​ */

CREATE VIEW [Topping Popularity] AS
	SELECT t.Name, COUNT(t.Name) AS [Number of times ordered] FROM Orders AS o
	JOIN Pizzas AS p
	ON o.Id = p.OrderId
	JOIN PizzaToppings AS pt
	ON p.Id = pt.PizzaId
	JOIN Toppings AS t
	ON t.Id = pt.ToppingId
	GROUP BY t.Name
GO

SELECT * FROM [Topping Popularity]
ORDER BY [Number of times ordered] DESC

/* There should be a view with users and the amount of pizzas they ordered​ */

CREATE VIEW [Pizzas Ordered By Users] AS
	SELECT dbo.GetFullName(u.FirstName, u.LastName) AS [User] ,COUNT(u.Id) AS [Pizzas Ordered] FROM Users AS u
	JOIN Orders AS o
	ON u.Id = o.UserId
	JOIN Pizzas AS p
	ON o.Id = p.OrderId
	GROUP BY dbo.GetFullName(u.FirstName, u.LastName)
GO

SELECT * FROM [Pizzas Ordered By Users]
ORDER BY [Pizzas Ordered] DESC
