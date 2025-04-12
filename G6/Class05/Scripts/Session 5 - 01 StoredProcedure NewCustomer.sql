CREATE OR ALTER PROCEDURE dbo.NewCustomer
(
	@Name nvarchar(100), @AccountNumber nvarchar(50), @City nvarchar(100), @RegionName nvarchar(100), @isActive bit
)
AS
BEGIN
	INSERT INTO [dbo].[Customer] ([Name], [AccountNumber], [City], [RegionName], [isActive])
	VALUES (@Name, @AccountNumber, @City, @RegionName, @isActive)

	select count(*) as TotalCostomersFirstLetter
	FROM [dbo].[Customer]
	where substring(Name,1,1) = substring(@Name,1,1)

	select count(*) as CustomersInRegion
	FROM [dbo].[Customer]
	where RegionName = @RegionName
END
GO

-- Test
exec dbo.NewCustomer 
	@Name = 'Viva',
	@AccountNumber = '123',
	@City  = 'Skopje',
	@RegionName ='Skopski',
	@isActive = 1


 