select * from Products
go

drop procedure if exists uspFindProductByName


CREATE OR ALTER PROCEDURE uspFindProductByName (
    @product_name varchar(100),
    @product_count INT OUTPUT,
	@Price_out decimal output
) AS
BEGIN
    SELECT 
        Name,
		Code,
        Price
    FROM
        dbo.Products
    WHERE
        Name Like '%'+@product_name +'%';

    SELECT @product_count = @@ROWCOUNT;
	-- @@ROWCOUNT -Returns the number of rows affected by the last statement. 
	set @Price_out = (select  price from Products
	where Name=@product_name)
END;
go
----

DECLARE @count INT;
declare @cena decimal;

EXEC uspFindProductByName 'Raw bars', @count output, @cena output
SELECT @count AS 'Number of products found'
select @cena as Cena;
go