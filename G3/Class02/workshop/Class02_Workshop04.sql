USE [SEDC]

--Change Products table always to insert value 1 in Price column if no price is provided on insert
ALTER TABLE [dbo].[Product]
ADD CONSTRAINT DFT_Product_Price
DEFAULT 1 FOR [Price]
GO

--Change Products table to prevent inserting Price that will more than 2x bigger then the cost price
ALTER TABLE [dbo].[Product]
ADD CONSTRAINT CHK_Product_Price
CHECK (Price <= Cost*2)
GO

--Change Products table to guarantee unique names across the products
ALTER TABLE [dbo].[Product]
ADD CONSTRAINT UQ_Product_Name
UNIQUE ([Name])
GO

SELECT Name FROM [dbo].[Product]
