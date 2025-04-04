USE [SEDC]
GO

DROP TABLE IF EXISTS [dbo].[Product_test]
GO

CREATE TABLE [dbo].[Product_test](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](50) NULL,
	[Name] [nvarchar](100) NULL,
	[Description] [nvarchar](max) NULL,
	[Weight] [decimal](18, 2) NULL,
	[Price] [decimal](18, 2) NULL,
	[Cost] [decimal](18, 2) NULL
	CONSTRAINT DFT_Products_Price DEFAULT(0)
	)
GO

insert into dbo.Product_test (Name) values ('Musli bar')
GO

select * from dbo.Product_test
GO

alter table Product_test 
add constraint DF_ProductTest_Weight 
default 100 for [Weight]
GO

insert into dbo.Product_test (Name) values ('Musli bar 2')
GO

select * from dbo.Product_test
GO

DROP TABLE IF EXISTS dbo.Product_test;




