/*

Change Products table always to insert value 1 in price column if no price is provided on insert
Change Products table to prevent inserting Price that will more than 2x bigger then the cost price
Change Products table to guarantee unique names across the products

*/

ALTER TABLE Products
ADD CONSTRAINT DF_Product_Price
DEFAULT 1 FOR [Price]
GO
ALTER TABLE [dbo].[Products] WITH CHECK
ADD CONSTRAINT CHK_Products_Price
CHECK (price<=Cost*2);
GO

-- This will fail due to duplicates (remove all duplicates)
ALTER TABLE [dbo].[Products] WITH CHECK
ADD CONSTRAINT UC_Product_Name UNIQUE (Name)
GO

update p set Name = 'Gluten Free New'
from dbo.Products p
where name = 'Gluten Free'
and id = 13
GO
