# Stored Procedures 🦺

A stored procedure is an already prepared SQL code that can be executed directly or it can be set to run at certain intervals. Unlike the functions, these procedures can use all statements and can return multiple results. Functions can also be called from stored procedures, but functions can't call stored procedures.

```sql
CREATE PROCEDURE [Students Without Group]
AS
  SELECT * FROM Students
  WHERE GroupId IS NULL

EXECUTE dbo.[Students Without Group];

CREATE PROCEDURE [Students Per Group]
AS
  SELECT GroupId, COUNT(*) as Students
  FROM Students
  GROUP BY GroupId
  HAVING GroupId IS NOT NULL
  ORDER BY Students;

EXECUTE dbo.[Students Per Group];
```

## Extra Materials📘

- [Microsoft Documentation](https://docs.microsoft.com/en-us/sql/t-sql/language-reference?view=sql-server-ver15)
  - [Stored Procedures](https://docs.microsoft.com/en-us/sql/relational-databases/stored-procedures/create-a-stored-procedure?view=sql-server-ver15)
    - [Working with Stored Procedures with SSMS](https://docs.microsoft.com/en-us/sql/relational-databases/stored-procedures/create-a-stored-procedure?view=sql-server-ver15#SSMSProcedure)
    - [Working with Stored Procedures with SQL](https://docs.microsoft.com/en-us/sql/relational-databases/stored-procedures/create-a-stored-procedure?view=sql-server-ver15#TsqlProcedure)
