Create Database HRMS
on
	(
		name='HRMS_data_1',
		FileName='C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\HRMS_data_1.mdf',
		Size=25mb,
		Maxsize=100mb,
		FileGrowth=5%
	);
log on
	(
		name='HRMS_log_1',
		FileName='C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\HRMS_Log_1.Ldf',
		Size=2mb,
		Maxsize=50mb,
		FileGrowth=1mb
	);

Use HRMS

	create table Region
	(
	RegionID int primary key,
	Regionname varchar(50)
	);

create table District
	(
	DistrictID int primary key,
	Districtname varchar (50),
	RegionID int references Region(RegionID)
	);

create table Locations
	(
	LocationID int primary key,
	street_address varchar (50),
	Postal_code varchar (50),
	);

create table Department
	(
	departmentID int primary key,
	Departmentname varchar (50)
	);

create table Jobs
	(
	Job_ID int primary key,
	Job_title varchar (50),
	min_salary money,
	max_salary money
	);

create table Employees
	(
	EmployeeID int primary key,
	First_name varchar (50),
	Last_name varchar (50),
	DateOFBirth varchar(50),
	Email varchar (50),
	Phone_number int,
	Hire_date Varchar(50),
	End_date Varchar(50),
	Salary numeric,
	doneBy varchar(50),
	ActivityTime datetime,
	DistrictID int references District(DistrictID),
	LocationID int references Locations(locationID),
	DepartmentID int references Department(DepartmentID),
	Job_ID int references jobs(Job_ID)
	);

create table EmployeesInfo_Update
	(
	EmployeeID int primary key,
	First_name varchar (50),
	Last_name varchar (50),
	DateOFBirth varchar(50),
	Email varchar (50),
	Phone_number int,
	Hire_date Varchar(50),
	End_date Varchar(50),
	Salary numeric,
	DistrictID int references District(DistrictID),
	LocationID int references Locations(locationID),
	DepartmentID int references Department(DepartmentID),
	Job_ID int references jobs(Job_ID)
	);

--------Create Table For Marge-----------
create table RegionMerge
	(
	RegionID int primary key,
	Regionname varchar(50)
	);

-----After Trigger-------------

Create Trigger TR_Employees on EmployeesInfo_Update
	after Update, Insert 
	as
	Begin
	insert into Employees 
	(EmployeeID,First_name,Last_name,DateOFBirth,Email,Phone_number,Hire_date,End_date,
	Salary,doneBy,ActivityTime,DistrictID,LocationID,DepartmentID,Job_ID)
	Select i.EmployeeID,i.First_name,i.Last_name,i.DateOFBirth,i.Email,i.Phone_number,
	i.Hire_date,i.End_date,i.Salary,SUSER_SNAME(),Getdate(),i.DistrictID,i.LocationID,i.DepartmentID,i.Job_ID
	from EmployeesInfo_Update Eu inner Join
	inserted i on Eu.EmployeeID= I.EmployeeID
	end;

-----------Table For Instead Of Trigger-----
CREATE TABLE HRLogs
	(
	LogId int IDENTITY(1,1) NOT NULL,
	Action_EmployeeId int NULL,
	ACTION varchar(50) NULL
	);

------------Instead Of Trigger ----------
create TRIGGER HR_InsteadOfDELETE ON EmployeesInfo_Update
	INSTEAD OF DELETE
	AS
	BEGIN
       SET NOCOUNT ON;
       DECLARE @Action_EmployeeId INT
       SELECT @Action_EmployeeId = DELETED.EmployeeID       
       FROM DELETED
       IF @Action_EmployeeId = 6
       BEGIN
              RAISERROR('EmployeeID 6 record cannot be deleted',16 ,1)
              ROLLBACK
              INSERT INTO HRLogs
              VALUES (@Action_EmployeeId, 'Record cannot be deleted.')
       END
       ELSE
       BEGIN
              DELETE FROM EmployeesInfo_Update
              WHERE EmployeeID  = @Action_EmployeeId
              INSERT INTO HRLogs
              VALUES(@Action_EmployeeId, 'Instead Of Delete')
       END
	END;

	Delete from EmployeesInfo_Update where EmployeeID= 6;
	Delete from EmployeesInfo_Update where EmployeeID= 3;
	select*from HRLogs;

------ NonClustered Index----
Create nonclustered index IX_Job_title
	on Jobs(Job_title);

-------Clustered Index-------------
Create nonclustered index IX_Regionname
	on Region(Regionname);

--------------Create View------------
Create view V_Employee as
	Select E.First_Name+''+E.Last_Name as Emp_Name, J.Job_title,
	E.Hire_date,E.Salary,
	D.Departmentname  from EmployeesInfo_Update E
	join Jobs J on J.Job_ID= E.Job_ID
	Join Department D on D.departmentID= E.DepartmentID 
	where EmployeeID>10;

--------Temploray Table------------
	IF OBJECT_ID('tempdb.dbo.##ProductTable') IS NOT NULL
	DROP TABLE ##ProductTable;
	create table ##ProductTable(id int, nam varchar(50), Price Money);
	insert into ##ProductTable(id, nam, Price) values(1,'Oil', 80);
	insert into ##ProductTable(id, nam, Price) values(2,'Gas', 30);
	select * from ##ProductTable;

	IF OBJECT_ID('tempdb.dbo.#ProductTable') IS NOT NULL
	DROP TABLE #ProductTable; 
	create table #ProductTable(id int, nam varchar(50), Price money);
	insert into #ProductTable(id, nam, Price) values(1,'Rice',50);
	insert into #ProductTable(id, nam, Price) values(1,'Suger',90);
	select * from #ProductTable;

---------------Function------------------
----------Table value Function-----------
Create Function fn_JobSalary
	()
	Returns Table
	Return
	(
	Select EmployeeID,sum(Salary) as amountsalary from EmployeesInfo_Update 
	Group by EmployeeID
	Having sum(Salary)> 100000
	);
---------------Scalar value function ------------
Create Function fn_EmployeeDistric
	()
	Returns int
	Begin
	Declare @DistrictID int;
	Select @DistrictID = count(*) from District;
	Return @DistrictID
	End;

------------multi statement function-------
create function fn_Employees_temp() 
	Returns @outTable table(First_Name nvarchar(50), 
	Salary Money, Salary_extent Money )
	begin
	insert into @outTable(First_Name, Salary, Salary_extent) 
	select First_Name, Salary, Salary = Salary + 1000 
	from Employees;
	return;
	end;

---------------Stored Procedure(insert)---------
Create Procedure SP_Jobs
	@Job_ID int,
	@Job_Title varchar (50),
	@Min_Salary money,
	@Max_salary Money
	as
	insert into Jobs(Job_ID,Job_Title,Min_Salary,Max_Salary) 
	Values(@Job_ID,@Job_Title,@Min_Salary,@Max_salary)
	Exec SP_Jobs '9','Assistan Officer', 20000, 25000;

---------Stored Procedure(Update)------------
Create Procedure SP_UpdateJobs 
	@Job_ID int,
	@Job_Title varchar (50),
	@Min_Salary money,
	@Max_salary Money
	as
	Update Jobs set Job_title=@Job_title
	where  Job_ID=@Job_ID 
	go
	Exec SP_UpdateJobs '9','Probation Officer',20000,40000;

---------Stored Procedure(Delete)------------ 
Create Procedure SP_deleteJobs 
	@Job_ID int,
	@Job_Title varchar (50),
	@Min_Salary money,
	@Max_salary Money
	as
	delete from SP_deleteJobs where Job_ID=@Job_ID
	go
	Exec SP_UpdateJobs '9','Probation Officer',20000,40000;

--------Sp with Parameters-------
 Create proc sp_withParameters
  @outputParam int output,
  @optionalParam date = null,
  @defaultParam varchar(40) = 'N/A'
  as
  set @outputParam = 1;
  if @optionalParam is null
	begin
	set @optionalParam = GETDATE();
	end;

	--------Sp without Parameters-------
create proc sp_withoutParameters
  as
  select 1
  go
  exec sp_withoutParameters;
