-- ==================== FLOW CONTROL ====================

-- ========= IF - ELSE =========
DECLARE @IsActive BIT = 0;

IF @IsActive = 1
	PRINT 'Customer is active.'
ELSE
	PRINT 'Customer is not active.'


-- ========= CASE (SWITCH) =========

-- Example: Convert gender code to text
SELECT 
	Id,
	FirstName,
	LastName,
	Gender,
	CASE Gender
		WHEN 'M' THEN 'MALE'
		WHEN 'F' THEN 'FEMALE'
	END AS GenderText
FROM dbo.Employee

-- Example: Check order status
SELECT 
	o.Id,
	o.[Status],
	CASE o.[Status]
		WHEN 0 THEN 'Pending'
		WHEN 1 THEN 'Shipped'
		WHEN 2 THEN 'Delivered'
		WHEN 3 THEN 'Canceled'
		ELSE 'Unknown'
	END AS StatusText
FROM [Order] o

