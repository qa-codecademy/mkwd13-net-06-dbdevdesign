-- ============== Data Seed for PizzaAppDB ==============

-- ===> Table: User
INSERT INTO [User] (FirstName, LastName, Address, Phone) 
VALUES
('Bob', 'Bobsky', '123 Bobsky St', '555-1234'),
('John', 'Doe', '456 John St', '555-6789'),
('Sarah', 'Johnson', '789 Maple Rd', '555-9012');

-- ===> Table: Pizza
INSERT INTO Pizza (Name, Price, Description) 
VALUES
('Margherita', 6.99, 'Classic with tomato and mozzarella'),
('Pepperoni', 8.49, 'Pepperoni and cheese'),
('BBQ Chicken', 9.99, 'Chicken, BBQ sauce, red onions'),
('Veggie', 7.49, 'Bell peppers, olives, mushrooms');

-- ===> Table: Topping
INSERT INTO Topping (Name, Price) 
VALUES
('Extra Cheese', 1.00),
('Mushrooms', 0.75),
('Onions', 0.50),
('Olives', 0.75),
('Pepperoni', 1.25),
('Bacon', 1.50);

-- ===> Table: PizzaTopping
INSERT INTO PizzaTopping (PizzaId, ToppingId) 
VALUES
(1, 1), -- Margherita: Extra Cheese
(2, 5), -- Pepperoni: Pepperoni
(3, 6), (3, 3), -- BBQ Chicken: Bacon, Onions
(4, 2), (4, 4), (4, 3); -- Veggie: Mushrooms, Olives, Onions

-- ===> Table: PizzaSize
INSERT INTO PizzaSize (Name) 
VALUES
('Small'),
('Medium'),
('Large');

-- ===> Table: Order
INSERT INTO [Order] (TotalPrice, IsDelivered, UserId) VALUES
(17.98, 1, 1),  -- Bob Bobsky's order
(14.99, 0, 2),  -- John Doe's order
(22.49, 1, 3);  -- Sarah Johnson's order

-- ===> Table: PizzaOrderItem
INSERT INTO PizzaOrderItem (OrderId, PizzaId, PizzaSizeId, Quantity, Price) 
VALUES
-- Bob Bobsky's order (Order 1)
(1, 1, 2, 1, 6.99),  -- Medium Margherita
(1, 2, 3, 1, 10.99), -- Large Pepperoni

-- John Doe's order (Order 2)
(2, 4, 2, 2, 7.50),  -- 2 Medium Veggie pizzas

-- Sarah Johnson's order (Order 3)
(3, 3, 3, 1, 9.99),  -- Large BBQ Chicken
(3, 2, 2, 1, 8.49),  -- Medium Pepperoni
(3, 1, 1, 1, 3.99);  -- Small Margherita 

SELECT * FROM [dbo].[User]
SELECT * FROM [dbo].[Order]
SELECT * FROM [dbo].[Pizza]
SELECT * FROM [dbo].[Topping]
SELECT * FROM [dbo].[PizzaTopping]
SELECT * FROM [dbo].[PizzaOrderItem]
SELECT * FROM [dbo].[PizzaSize]

