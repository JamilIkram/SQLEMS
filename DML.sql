Use HRMS

Insert into Region values	(1,'North'),
							(2,'South'),
							(3,'DCC');

Insert into District values (1,'Rajshahi',1),
							(2,'Mymensingh',1),
							(3,'Sylhet',1),
							(4,'Rangpur',1),
							(5,'Dhaka',3),
							(6,'Comilla',2),
							(7,'Khulna',2),
							(8,'Borisal',2),
							(9,'Chottogram',2),
							(10,'Jossor',2);
						
Insert into Locations values(1, 'Sadhur Mor Rajshahi',6240),
							(2, 'Maskana Mymensingh',7580),
							(3, 'Mira Bazar, Sylhet', 8570),
							(4, 'Payrachottor, Rangpur', 4020),
							(5, '15/A, KawranBazar Dhaka',1215),
							(6, '88/C, Motijhil Dhaka', 1222),
							(7, 'Doulotpur, Khulna', 2290),
							(8, 'Kazipar , Borisal', 5540),
							(9, '83/H Wasar Mor, Chottogram', 4410),
							(10,'Banglopara Mor,Jossor', 7050);


Insert into Department values(1,'Administration'),
							 (2,'Accounce & Finace'),
							 (3,'Salse & Marketing'),
							 (4,'Human Resourse Management');

Insert into Jobs values		(1,'Managing Directer',180000,200000),
							(2,'Assistant Director',140000,160000),
							(3,'Regional Manager',100000, 120000),
							(4, 'Senior Executive',70000, 80000),
							(5, 'Executve Officer',50000,60000),
							(6, 'Senior officer',35000, 40000),
							(7, 'Officer', 30000,35000),
							(8, 'Junior Officer',25000,30000);

select* from Employees
		Insert into EmployeesInfo_Update values 
		(1,'Najim','Uddin','1980/05/22','najimuddin@gmail.co',01999999999,'2002/2/26','22/11/2021',190000,5,3,1,1);
		Insert into EmployeesInfo_Update values
		(2,'Akram','Uddin','1985/05/20','akramuddin@gmail.co',01999956399,'2008/2/21',null,55000,8,8,3,5);
		Insert into EmployeesInfo_Update values
		(3,'Jahid','Hasan','1982/09/20','hasan@gmail.com',01756325874,'2003/07/02',null,140000,5,5,4,2);
		Insert into EmployeesInfo_Update values
		(4,'Tanvir','Hawladar','1996/05/10','thawlader@gmail.com',01625847523,'2020/09/21',null,25000,9,9,3,8);
		Insert into EmployeesInfo_Update values
		(5,'Jisan','Tanvir','1990/02/20','jisant@gmail.com',01985236545,'2017/01/05',null,35000,5,5,1,6);
		Insert into EmployeesInfo_Update values
		(6,'Wali','Islam','1985/06/15','walislam@gmail.com',01600058965,'2010/08/05',null,100000,2,2,2,3);
		Insert into EmployeesInfo_Update values
		(7,'Shumon','Khan','1988/06/12','shumon@gmail.com',01802536987,'2015/03/16',null,60000,9,9,3,5);
		Insert into EmployeesInfo_Update values
		(8,'Setu','Akter','1981/06/28','aksetu@gmail.com',01503214569,'2005/03/16',null,105000,1,5,4,3);
		Insert into EmployeesInfo_Update values
		(9,'Saiful','Islam','1996/06/13','saiful@gmail.com',01756984123,'2014/03/16',null,40000,2,2,3,6);
		Insert into EmployeesInfo_Update values
		(10,'Rehan','Molla','1996/08/19','mollar@gmail.com',01832156987,'2020/09/16',null,25000,10,10,3,8);
		Insert into EmployeesInfo_Update values
		(11,'Nayem','Rahman','1975/11/02','khannayem@gmail.com',01725361452,'2002/03/03',null,150000,1,1,3,2);
		Insert into EmployeesInfo_Update values
		(12,'Shumon','Khan','1988/06/12','shumon@gmail.com',01802536987,'2015/03/16',null,60000,9,9,3,5);
		Insert into EmployeesInfo_Update values
		(13,'Shanta','Akter','1995/07/15','santaakter@gmail.com',01962541782,'2019/06/17',null,60000,7,7,2,7);
		Insert into EmployeesInfo_Update values
		(14,'Ratul','Mia','1998/08/12','ratul@gmail.com',01902364863,'2021/06/03',null,25000,4,4,3,8);
		Insert into EmployeesInfo_Update values
		(15,'Juyel','Rahman','1994/12/29','juyal@gmail.com',01536985478,'2017/08/18',null,35000,5,5,3,7);
		Insert into EmployeesInfo_Update values
		(16,'Emon','Ahmed','1990/04/22','emon@outlook.com',01502652145,'2016/06/02',null,55000,5,5,4,5);
		Insert into EmployeesInfo_Update values
		(17,'Brinta','Ghos','1994/07/29','brinta@yahoo.com',01602136547,'2018/09/22',null,35000,3,3,3,7);
		Insert into EmployeesInfo_Update values
		(18,'Kamal','Ahmed','1990/06/12','kamal@gmail.com',01882365136,'2014/09/25','2021/09/22',70000,5,5,2,5);
		Insert into EmployeesInfo_Update values
		(19,'Arman','Fahim','1993/06/12','armanfh@gmail.com',01556236237,'2018/04/16',null,50000,4,4,3,5);
		Insert into EmployeesInfo_Update values
		(20,'Naorin','Jahan','1989/01/22','naorinjahan@gmail.com',01632145977,'2016/09/30',null,40000,5,5,1,6);

-------test------------
		select*from Region;
		select* from District;
		select*from Locations;
		select*from Department;
		select*from Jobs;
		select*from EmployeesInfo_Update;
		select*from Employees;
		select* from V_Employee;
		select* from dbo.fn_JobSalary();
		select dbo.fn_EmployeeDistric();
		select * from fn_Employees_temp();
		select*from HRLogs;

------------Join-------
		Select J.Job_Title, D.Districtname, Count(E.DateOFBirth) as Emp_Number,E.Salary,
		L.street_address From EmployeesInfo_Update E
		Join Jobs J on J.Job_ID=E.Job_ID
		Join District D on D.DistrictID=E.DistrictID
		Join Locations L on L.LocationID=E.LocationID
		Group by J.Job_Title, D.Districtname, E.Salary,L.street_address
		Having E.Salary> 50000;

---------Sub Quary---------------
		Select J.Job_Title, D.Districtname,E.Salary,
		L.street_address From EmployeesInfo_Update E
		Join Jobs J on J.Job_ID=E.Job_ID
		Join District D on D.DistrictID=E.DistrictID
		Join Locations L on L.LocationID=E.LocationID
		where E.Salary in 
		( select Salary from EmployeesInfo_Update where Salary> 50000 and EmployeeID>10);

------------CTE-----------------
		WITH CTE_Employee_Age([Name], DateOfBirth, CurrentDate, Age) AS (
		SELECT    
		E.First_Name + ' ' + E.Last_Name, 
		E.DateOFBirth,
		GETDATE(),
		YEAR(GETDATE()) - YEAR(E.DateOfBirth)
		FROM EmployeesInfo_Update E)
		SELECT [Name], DateOfBirth,Age
		FROM CTE_Employee_Age
		WHERE Age <= 30;

--------------Case------------
		SELECT D.Departmentname,
		CASE
		WHEN D.Departmentname = 'Salse & Marketing' THEN 'Field Duity'
		ELSE 'Office desk Duity'
		END AS Comments
		from EmployeesInfo_Update E
		join Department D on E.DepartmentID = D.DepartmentID;

------------Marge------------
		Select* from Region
		Select* from RegionMerge

		merge into dbo.RegionMerge as Rm
		using dbo.Region as R
		on Rm.RegionID=R.RegionID
		when matched then 
		update set Rm.Regionname=R.Regionname
		when not matched then
		insert(RegionID,Regionname) 
		values(R.RegionID, R.Regionname );

--------Rollup------------
		SELECT Job_title FROM Jobs
		GROUP BY rollup (Job_title);

--------Having-----
		select  * from Employees
		SELECT COUNT(EmployeeID) as [number], Salary
		FROM Employees
		GROUP BY Salary;

------Cast----
		select cast('01-June-2019 10:00 AM ' AS datetime2);

------Convert----
		Select datetime =convert(date, '01-june-2021 10:00:00');

----Update view---
		Update V_Employee set Job_title = 'Senior officer' where Emp_Name= 'ShantaAkter';

--------Delete Vlaues--------
		drop view V_Employee;