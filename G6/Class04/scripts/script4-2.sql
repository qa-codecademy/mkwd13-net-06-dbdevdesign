-- Null Functions

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

select
	s.ID, s.[Name], c.[Name] as College
from
	@Student as s
	left join @College as c on s.CollegeID = c.ID

-- IS NULL
select
	s.ID, s.[Name], c.[Name] as College
from
	@Student as s
	left join @College as c on s.CollegeID = c.ID
where
	c.[Name] is null

-- IS NOT NULL
select
	s.ID, s.[Name], c.[Name] as College
from
	@Student as s
	left join @College as c on s.CollegeID = c.ID
where
	c.[Name] is not null

-- COALESCE, ISNULL
select
	s.ID, s.[Name], Coalesce(c.[Name], 'no college') as College_Coalesce, ISNULL(c.[Name], 'no college') as College_IsNull
from
	@Student as s
	left join @College as c on s.CollegeID = c.ID

-- NULLIF
select
	s.ID, NULLIF(s.[Name], 'Darko') as Student_NullIF, c.[Name] as College
from
	@Student as s
	left join @College as c on s.CollegeID = c.ID

-- Date methods

declare @dt datetime
set @dt = GETDATE()
select @dt

select @dt as DateNow, DATEADD(day, -7, @dt) as DateLastWeek, DATEADD(day, 7, @dt) as DateNextWeek

select @dt as DateNow, DATEADD(minute, -15, @dt) as DateBefore15Minutes, DATEADD(minute, 15, @dt) as DateAfter15Minutes
GO

﻿-- CAST, CONVERT

declare @dt datetime
set @dt = Getdate()

select
	'broj 20' as Str_Varchar
,	N'број 20' as Str_NVarchar
,	cast('20' as int) as Varchar_Cast_Int
,	cast(N'20' as int) as NVarchar_Cast_Int
,	convert(int, '20') as Varchar_Convert_Int
,	convert(int, N'20') as NVarchar_Convert_Int
,	@dt as Datetime_Default
,	convert(varchar(50), @dt, 104) as Datetime_Convert_Varchar	--dd.mm.yyyy