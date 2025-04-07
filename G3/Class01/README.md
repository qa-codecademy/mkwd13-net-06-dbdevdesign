# Welcome to Databases with SQL Server 👔

## Introduction to Databases

We often say that somewhere in the mid-20th century, we entered a new era - The Information Era. And with this came the need for better, faster, and more organized systems for storing and working with data. Data can be simply explained as a collection of values that have some meaning and are usually numeric or alphanumeric. But storing and keeping track of data is not a new concept. Throughout the years, humanity stored data with a lot of different systems such as painting and etching rocks, drawing and writing on clay, writing and printing paper, and even punching holes in cards. All of these systems had one goal: Store and keep track of values of interest. Since we rely on data more and more each passing year, the systems for keeping track and organizing it are becoming more advanced. Such systems are the databases, which are digital collections of data. These databases are designed specifically to store, go through and manage digital data in a fast and reliable way.

## Database concepts and usage

A database is not one single system that you can get and use. There are many database solutions, many database types, and many different approaches to how to manage and use the data in them. Depending on the product you are building, you can pick different databases that work best for that given situation. In the world of web development, for example, a database is used as a storage system for the back-end part of the solution. This database can be accessed and manipulated by a special querying language, but often there are libraries and frameworks used to create an extra layer of communication, so we can better create a bridge between our back-end code and the database.

![Database concept](../img/databases.png)

## Types of databases

![Relational vs Non-Relational](../img/relational-vs-nonrelational.jpg)

### Relational Databases

Relational databases are structured databases where the data stored in them is organized in an interconnected system of tables which consist of columns and rows. These databases are called relational because all of the tables can be related to one another, depend on each other and combine data from each other to create new data sets. We usually create and organize relational databases by the business logic that we have in our solution.

Tables reflect main business objects of value such as:

- User
- Order
- Product
- Customer
- Store

Columns reflect the properties that represent the business object such as:

- First Name
- Last Name
- Address
- Identification Number
- Color
- Size
- Price

Rows are representing a record of an individual business object such as:

- 1122 / Bob / Bobsky / 23 / St. Bobstreet No.12
  - User Id / First Name / Last Name / Age / Address
- 43345 / Sneakers / 60$ / 11
  - Product Id / Name / Price / In Stock
- 12341 / 1122 / 20.07.2022 / 120$ / Fast Delivery
  - Order Id / Recepient Id / Date of Delivery / Price / Type of Delivery

Example of a table:

| **Id** | **FirstName** | **LastName** | **Age** | **Address**            |
|--------|---------------|--------------|---------|------------------------|
| 1122   | Bob           | Bobsky       | 23      | St. Bobstreet No.12    |
| 1123   | Jill          | Wayne        | 33      | St. Waynestreet No.63b |
| 1124   | Greg          | Gregsky      | 49      | St. Gregstreet No.9    |

### Non-Relational Databases

Ther is another type of database that is less structured and more flexible, and that is the non-relational type. These databases do not have any tables or rows or columns or relationships. This means that data is just stored somewhere, like a document file. Because there are much fewer constraints, we can easily organize different types of data in any way we see fit and the process will be much simpler than in relational databases.

### Relational vs Non-Relational

| **Relational**                                                | **Non-Relational**                                              |
|---------------------------------------------------------------|-----------------------------------------------------------------|
| RELATIONAL DATABASE MANAGEMENT SYSTEM (RDBMS)                 | Non-relational or distributed database system                   |
| These databases have fixed or static or predefined schema     | They have dynamic schema                                        |
| These databases are not suited for hierarchical data storage  | These databases are best suited for hierarchical data storage.  |
| These databases are best suited for complex queries           | These databases are not so good for complex queries             |
| Vertically Scalable                                           | Horizontally scalable                                           |

## What is SQL

Database stores data as we mentioned numerous times, but that's just the storage solution. We need to also access and manage this data. This is where SQL ( Structured Query Language ) comes to play. This programming language is designed to manage relational databases and do various actions with the data stored in them. We use this language to write queries, which are pieces of code that instruct the database to do something. These queries can be executed on the database through software specifically designed for databases, features on some IDE provide execution of queries, with command-line tools and we can even send queries from our back-end code. So we can't just use a database by itself. We need SQL to use the database and the data in it.

## Database Management Systems

To have better control and integration with databases, different tech companies built different database management systems. All of these management systems have the same goal, to store data and provide a fast, precise, and reliable experience for managing it. For relational databases, the main language that is used is SQL and there is just ONE programming language that is used everywhere. So far so good. Since there are many management systems, and they are owned by different companies with different goals and principles, the SQL language needs to do some extra stuff to accommodate the requirements of the company that owns the management system. This is solved by creating extensions to SQL itself, and every management system can create an extension and add extra features on top of the SQL programming language. Here are some of the most popular:

- Microsoft SQL Server and TSQL ( Transact SQL )
- MySQL
- PostgreSQL
- Oracle Database
- SQLite

## Microsoft SQL Server and SSMS

Microsoft SQL Server is a Microsoft database management system and it uses Transact SQL. Microsoft server can be installed on any computer and that computer can host and manage Microsoft SQL Databases. There are two types of installations for this and those are:

- Microsoft SQL Server
- Microsoft SQL Server Express ( Installation Guide )

There is also an environment that provides a user interface for managing Microsoft SQL Databases. It's called SQL Server Management Studio. This environment can be installed on any PC for free and can be used to do almost all management actions to a Microsoft SQL Server Database. It can connect to the local machine it is installed on, connect to a server that has Microsoft SQL Server installed, or even connect to the cloud. A guide on how to install it can be found HERE.

### Installation guide

1. https://www.microsoft.com/en-us/sql-server/sql-server-downloads
2. download a free specialized edition -> Express
3. Basic Installation Type
4. Wait until installation finishes
    - [Optional] Copy the connection string that shows up at the end of the installation into a text file and save it
5. Download SSMS [here](https://docs.microsoft.com/en-us/sql/ssms/download-sql-server-management-studio-ssms?view=sql-server-ver15) or install it through the Install SSMS button from the SQL Server Express Installation
6. Open the installation and click on install

> Note: This is your local server name for SQLExpress => localhost\SQLEXPRESS
> Note: This is your connection string if you are trying to connect from code => Server=localhost\SQLEXPRESS;Database=master;Trusted_Connection=True;
> Note: In depth guide can be found [here](../../InstallationGuide.md)

## MSSQL Database and basic features

### Access your local databases

### Data Types

Like any software environment, databases have a set of supported data types that we can use to define data that we plan to store. It is strongly recommended for databases to use precise data types for the things we want to keep since the amount of data usually kept in the database is very large and allocation of memory for a certain type can cost a lot. That means that we don't need to use a full integer if we know that some field will hold numbers from 1 to 100. We can also cap the characters of a string for storage. Here are some of the most important data types:

| **Type** | **Description**          |
|----------|--------------------------|
| bit      | 1, 0 or NULL             |
| tinyint  | 1 byte integer           |
| smallint | 2 bytes integer          |
| int      | 4 bytes integer          |
| bigint   | 8 bytes integer          |
| decimal  | Exact decimal numbers    |
| date     | Only date                |
| datetime | Date and time            |
| time     | Only time                |
| nchar    | Single unicode character |
| nvarchar | Unicode string           |
| char     | Single character         |
| varchar  | String                   |

### Create a database

Creates a new database on the server you are currently logged in ( localhost is your machine )

```sql
CREATE DATABASE MyAppDatabase;
```

### Delete ( Drop ) a database

Deletes ( drops ) a database on the server you are currently logged in ( localhost is your machine )

```sql
DROP DATABASE MyAppDatabase;
```

### Create a table

Creates a new table on the currently selected database. You need to specify if you don't have a database selected or if you want to target the query on another database.

```sql
/* Use this to target a certain database. You can leave this out if you want the query to be executed in the selected database in SSMS */
USE MyAppDatabase;

CREATE TABLE Students (
    StudentId int,
    FirstName nvarchar(255),
    LastName nvarchar(255),
    Age tinyint
);
```

### Get records from a table

Getting records, or SELECTING shows a result table of the records in a table. This can be extended with filters and order commands as well

```sql
/* Use this to target a certain database. You can leave this out if you want the query to be executed in the selected database in SSMS */
USE MyAppDatabase;

/* Select all records from a table */
SELECT * FROM Students;

/* Select all records from a table but only show FirstName and LastName columns */
SELECT FirstName, LastName FROM Students;
```

### Add a new record in a table ( Insert )

```sql
/* Use this to target a certain database. You can leave this out if you want the query to be executed in the selected database in SSMS */
USE MyAppDatabase;

/* Insert a single record */
INSERT INTO Students (FirstName, LastName, Age)
VALUES ('Bob', 'Bobsky', 43);

/* Insert multiple records */
INSERT INTO Students (FirstName, LastName, Age)
VALUES 
('Jill', 'Wayne', 31),
('Greg', 'Gregsky', 22),
('Bill', 'Billsky', 56);

/* Check if the records are inserted in the table */
SELECT * FROM Students;
```

### Delete records in a table

```sql
/* Use this to target a certain database. You can leave this out if you want the query to be executed in the selected database in SSMS */
USE MyAppDatabase;

DELETE FROM Students;

/* Check if the records are deleted from the table */
SELECT * FROM Students;
```

### Update ( Alter ) a table

```sql
/* Use this to target a certain database. You can leave this out if you want the query to be executed in the selected database in SSMS */
USE MyAppDatabase;

/* Add a new column to a table */
ALTER TABLE Students
ADD City nvarchar(255);

/* Remove a column from a table */
ALTER TABLE Students
DROP COLUMN City;
```

### Delete ( Drop ) a table

```sql
/* Use this to target a certain database. You can leave this out if you want the query to be executed in the selected database in SSMS */
USE MyAppDatabase;

DROP TABLE Students;
```

## Extra Materials 📘

- [Microsoft Documentation](https://docs.microsoft.com/en-us/sql/t-sql/language-reference?view=sql-server-ver15)
  - [Create Database](https://docs.microsoft.com/en-us/sql/relational-databases/databases/create-a-database?view=sql-server-ver15)
  - [Drop Database](https://docs.microsoft.com/en-us/sql/t-sql/statements/drop-database-transact-sql?view=sql-server-ver15)
  - [Create Table](https://docs.microsoft.com/en-us/sql/t-sql/statements/create-table-transact-sql?view=sql-server-ver15)
  - [Alter Table](https://docs.microsoft.com/en-us/sql/t-sql/statements/alter-table-transact-sql?view=sql-server-ver15)
  - [Drop Table](https://docs.microsoft.com/en-us/sql/t-sql/statements/drop-table-transact-sql?view=sql-server-ver15)
  - [Get data from a table](https://docs.microsoft.com/en-us/sql/t-sql/queries/select-transact-sql?view=sql-server-ver15)
  - [Insert data into a table](https://docs.microsoft.com/en-us/sql/t-sql/statements/insert-transact-sql?view=sql-server-ver15)
  - [Modify data from a table](https://docs.microsoft.com/en-us/sql/t-sql/queries/update-transact-sql?view=sql-server-ver15)
  - [Remove data from a table](https://docs.microsoft.com/en-us/sql/t-sql/statements/delete-transact-sql?view=sql-server-ver15)
- [What is SQL Server](https://medium.com/swlh/sql-server-introduction-9e172e5d66ba)
- [What is a database and how to use it](https://docs.microsoft.com/en-us/sql/relational-databases/databases/databases?view=sql-server-ver15)
- [How to use SSMS](https://www.sqlshack.com/overview-of-microsoft-sql-server-management-studio-ssms/)
