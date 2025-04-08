-- IF and CASE
declare @Student table
(ID int, [Name] nvarchar(50), CollegeID int)
declare @College table
(ID int, [Name] nvarchar(50))

insert into @Student (ID, [Name], CollegeID)
values
	(1, 'Aco', 1)
,	(2, 'Bojan', 2)
,	(3, 'Cobe', 1)
,	(4, 'Darko', null)
insert into @College (ID, [Name])
values
	(1, 'MIT')
,	(2, 'Berkeley')
,	(3, 'Princeton')

declare @ConcatCollegeID varchar(50)
set @ConcatCollegeID = 'Yes'

if (@ConcatCollegeID = 'Yes')
begin
	select
		s.ID, s.[Name],
		case
			when c.ID is not null then Cast(c.ID as nvarchar(10)) + '. ' + c.[Name]
			else null
		end as College
	from
		@Student as s
		left outer join @College as c on s.CollegeID = c.ID
end
else
begin
	select
		s.ID, s.[Name], c.[Name] as College
	from
		@Student as s
		left join @College as c on s.CollegeID = c.ID
end
GO

-- while
declare @i int set @i = 0
declare @College table (ID int, [Name] nvarchar(50))

while (@i < 10)
begin
	if (@i = 5)
	begin
		set @i = @i + 1
		continue;
		--break;
	end
	insert into @College (ID, [Name])
	values (@i, 'College ' + Cast(@i as varchar(10)))
	set @i = @i + 1
end
select * from @College
GO