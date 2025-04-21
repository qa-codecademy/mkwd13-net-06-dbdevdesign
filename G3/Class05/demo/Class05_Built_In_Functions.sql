-- ==================== BUILT-IN FUNCTIONS ====================

-- ======= CAST() =======
-- Converts an expression from one data type to another.

-- Use Cases:
-- Convert string to int (or vice versa)
-- Format data for display
-- Ensure type compatibility in expressions

-- Example 1: Convert decimal to integer
SELECT CAST(140.533 AS INT) AS RoundedNumber

-- Example 2: Convert date to string
SELECT CAST(GETDATE() AS NVARCHAR(20)) as DateAsText


-- ======= String Functions =======

-- ======= LEN() =======
-- Returns the number of characters in a string (excluding trailing spaces)
-- Use Cases:
-- Validating field lengths
-- Detecting empty or short strings
SELECT 
	e.FirstName, 
	LEN(e.FirstName) as FirstNameLength 
FROM dbo.Employee e

-- ======= UPPER() / LOWER() =======
SELECT
	Name,
	UPPER(Name) as UpperCased,
	LOWER(Name) as LowerCased
FROM dbo.BusinessEntity

-- ======= SUBSTRING() =======
-- Extracts part of a string starting at a given position for a given length.

-- Use Cases:
-- Extract ID parts, year from dates, etc.
-- Clean or display partial text
-- Text parsing
SELECT FirstName, SUBSTRING(FirstName, 1, 2) as FirstTwoLetters
FROM dbo.Employee

-- ======= LEFT() / RIGHT() =======
-- Returns a specified number of characters from the start or end of a string.

-- Use Cases:
-- Extract part of zip codes, IDs, etc.
-- Format display values

SELECT 
	AccountNumber,
	LEFT(AccountNumber, 2) AS AccountPrefix,
	RIGHT(AccountNumber, 2) AS AccountSuffix
FROM Customer

-- ======= REPLACE() =======
-- Replaces all occurrences of a specified string with another string.

-- Use Cases:
-- Replace characters in names (e.g., replace "-" with " ")
-- Format phone numbers or codes
-- Clean unwanted characters
SELECT c.PhoneNumber, REPLACE(c.PhoneNumber, '070', '+38970') FROM Customer c


-- ======= DATE Functions =======

-- ======= GETDATE() =======
-- Returns the current system date and time.

-- Use Cases:
-- Insert timestamp
-- Compare with other dates (filtering, logging)

SELECT GETDATE() AS CurrentDateTime;
SELECT GETUTCDATE() AS CurrentDateTime;

-- ======= DATEDIFF() =======
-- Returns the difference between two dates.

-- Use Cases:
-- Calculate age
-- Time passed since hire or order date

-- Example:
SELECT
	FirstName,
	LastName,
	DateOfBirth,
	DATEDIFF(YEAR, DateOfBirth, GETUTCDATE()) AS Age
FROM Employee

-- ======= DATEADD() =======
-- Adds a specified number of units (days, months, years) to a date.

-- Use Cases:
-- Project due dates
-- Expiration date logic

-- Example:
SELECT 
    OrderDate,
    DATEADD(DAY, 7, OrderDate) AS ExpectedDelivery
FROM [Order];



-- ======= Numeric Functions =======

-- ======= ROUND() =======
-- Definition:
-- Rounds a numeric value to the specified number of decimal places.

-- Use Cases:
-- - Format prices
-- - Round totals for financial summaries
SELECT Name, Price, ROUND(Price, 0) AS RoundedPrices FROM dbo.[Product]


-- ======= ISNULL() =======
-- Replaces NULL with a specified replacement value.

-- Use Cases:
-- Display default values
-- Prevent NULLs in reports
SELECT Name, ISNULL(PhoneNumber, 'N/A') AS DisplayPhoneNumber FROM Customer

