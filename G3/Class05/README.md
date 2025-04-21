# Built in and Scalar functions 👘

## Built-In Functions

Built-in functions are functions that help with manipulating and working with data. They can be used anywhere where expressions are allowed. 

```sql
/* LEN returns the number of characters in a string */
/* Shows the length of all the names in the Students table */
SELECT FirstName, LEN(FirstName) AS [Name Length] From Students;

/* SUBSTRING returns part of a string by given parameters */
/* Shows all students and the group they are in by number */
SELECT st.FirstName, st.LastName, SUBSTRING(gr.Name, 2, 3) as [Group] FROM Students AS st
JOIN Groups AS gr ON st.GroupId = gr.GroupId;

/* REPLACE returns a processed value that is partly or fully replaced */
/* Shows all students and the group they are in, marking all groups with Group in front of them */
SELECT st.FirstName, st.LastName, REPLACE(gr.Name, 'G', 'Group ') as [Group] FROM Students AS st
JOIN Groups AS gr ON st.GroupId = gr.GroupId;

/* GETDATE returns the Date and Time now */
ALTER TABLE Students
ADD DateCreated DateTime;

/* It inserts a new student and populates the DateCreated with the current date and time */
INSERT INTO Students (FirstName, LastName, Age, City, DateCreated)
VALUES ('Derp', 'Bobsky', 43, 'Bitola', GETDATE());

/* LOWER and UPPER return uppercase or lowercase string */
/* Results in showing all uppercase first names and all lowercase last names */
SELECT UPPER(FirstName), LOWER(LastName) FROM Students;
```

## Programming Concepts and Scalar Functions

With SQL we can also write our functions. These are functions that we can execute, pass down parameters, and return values, just like any other functions. Functions must return a single value (Which could be a value or table ). Functions can't use SQL Server statements such as INSERT or DELETE. The only statement that we can use is SELECT.

Conventional programming concepts can be used in functions and queries as well, to build some more complex logic. Blocks of code also exist, but they are not done with brackets, like some programming languages ( Ex: C#, JavaScript ), but use a BEGIN and END statements to state the beginning and end of a block of code.

### Programming Concepts

```sql
/* Variables */
DECLARE @number1 INT;
DECLARE @number2 INT;
DECLARE @result INT;

SET @number1 = 5;
SET @number2 = 10;
SET @result = @number1 + @number2;

SELECT @result as Result;

/* If/Else */
DECLARE @name NVARCHAR(255);
SET @name = 'Bob';

IF(LEN(@name) < 2 )
  SELECT 'Too short name';
ELSE 
  SELECT @name + ' is a suitable name.' AS [Name Check Result];

/* Block of Code */
DECLARE @name NVARCHAR(255);
DECLARE @age INT;
DECLARE @result NVARCHAR(255);
SET @name = 'Bob';
SET @age = 200;


IF(LEN(@name) < 2 )
BEGIN
  SELECT 'ERROR' AS [Status];
  SET @result = 'Too short name!';
END
ELSE 
BEGIN
  IF(@age > 120)
  BEGIN
    SELECT 'ERROR' AS [Status];
    SET @result = 'Age is not correct!';
  END
  ELSE
  BEGIN
    SELECT  'SUCCESS' AS [Status];
    SET @result = @name + ' is a suitable name.';
  END
END

SELECT @result AS [Name Check Result];
```

### Scalar Functions

```sql
/* Function that gets the full name of a person */
CREATE FUNCTION FullName(@firstName NVARCHAR(255), @lastName NVARCHAR(255))
RETURNS NVARCHAR(255)
AS
BEGIN
  RETURN @firstName + ' ' + @lastName
END;

/* Calling a Scalar function to Students and Trainers table */
SELECT dbo.FullName(FirstName, LastName) as [Student Full Name] FROM Students;
SELECT dbo.FullName(FirstName, LastName) as [Student Full Name] FROM Trainers;
```

## Extra Materials 📘

- [Microsoft Documentation](https://docs.microsoft.com/en-us/sql/t-sql/language-reference?view=sql-server-ver15)
  - [ALL MSSQL Built in functions](https://docs.microsoft.com/en-us/sql/t-sql/functions/functions?view=sql-server-ver15)
  - [Control of Flow](https://docs.microsoft.com/en-us/sql/t-sql/language-elements/control-of-flow?view=sql-server-ver15)
  - [Scalar Functions](https://docs.microsoft.com/en-us/sql/t-sql/statements/create-function-transact-sql?view=sql-server-ver15)