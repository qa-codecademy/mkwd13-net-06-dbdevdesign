CREATE PROCEDURE NewCustomer
(
	@Name NVARCHAR(100),
	@AccountNumber NVARCHAR(20),
	@City NVARCHAR(100),
	@RegionName NVARCHAR(100),
	@CustomerSize NVARCHAR(10),
	@PhoneNumber NVARCHAR(20),
	@IsActive bit
)
AS
BEGIN
	INSERT INTO Customers(Name, AccountNumber, City, RegionName, CustomerSize, PhoneNumber, IsActive)
	VALUES (@Name, @AccountNumber, @City, @RegionName, @CustomerSize, @PhoneNumber, @IsActive)

	SELECT COUNT(*) AS TotalCustomersWithSameFirstLetter
	FROM Customers
	WHERE SUBSTRING(Name, 1, 1) = SUBSTRING(@Name, 1, 1)

	SELECT COUNT(*) AS CustomersInRegion
	FROM Customers
	WHERE RegionName = @RegionName
END


EXEC dbo.NewCustomer
	@Name = 'Viva',
	@AccountNumber = '12345678',
	@City = 'Skopje',
	@RegionName = 'Skopski',
	@CustomerSize = 'Big',
	@PhoneNumber = '070/222-333',
	@IsActive = 1


	SELECT * FROM Orders