CREATE OR ALTER PROCEDURE dbo.usp_InsertProduct
(
	@Code nvarchar(50), @Name nvarchar(100), @Description nvarchar(max), @Weight decimal(18,2), @Price decimal(18,2), @Cost decimal(18,2)
,	@ProductID int OUT
)
AS
BEGIN
	INSERT INTO [dbo].[Products]([Code], [Name], [Description], [Weight], [Price], [Cost])
	VALUES (@Code, @Name, @Description, @Weight, @Price, @Cost)

	set @ProductID = Scope_Identity()

	select * from [dbo].[Products] where ID = @ProductID
END
GO

DECLARE
	@ReturnValue int
,	@ProductIdOut int

EXEC @ReturnValue = dbo.usp_InsertProduct
	@Code = 'TestCode'
,	@Name = 'TestName'
,	@Description = 'TestDescription'
,	@Weight = 0
,	@Price = 0
,	@Cost = 0
,	@ProductId = @ProductIdOut OUT

SELECT @ReturnValue as ReturnValue, @ProductIdOut as ProductIdOut

select * from Products