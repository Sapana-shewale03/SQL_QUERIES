create table region(reg_id int primary key,reg_name varchar(20));
create table countries(country_id char(2) primary key,country_name varchar(22),reg_id constraint fkregid foreign key
reg_id references region(reg_id));
create table jobs(job_id int primary key,job_title varchar(22),minsalary int,maxsalary int);
create table location(location_id int primary key,street_addr varchar(22),post_code int,city varchar(20),state_pr varchar(10)
country_id constraint fkcouid foreign key country_id references countries(country_id));
create table department(dept_id int primary key,dept_name varchar(22),manager_id int,location_id constraint 
fklocid foreign key location_id references location(location_id));
create table employees(emp_id int primary key,first_name varchar(22),last_name varchar(22),email varchar(10),
phone_nu int,hire_date date, manager_id int,salary int,comm_pct int,job_id int ,constraint fkcnjid foreign key(job_id)
references jobs(job_id),dept_id int constraint fkcddid foreign key(dept_id) references department(dept_id));

update employees set hire_date = null where dept_id=4;

alter table employees alter column hire_date date null;
--Write a query to display the names (first_name, last_name) and salary for all employees whose salary is not in the range $10,000 through $15,000
select first_name,last_name,salary from employees where salary between 10000 and 15000;
--Write a query to display the names (first_name, last_name) and department ID of all employees in departments 30 or 100 in ascending alphabetical order by department ID.
select first_name,last_name,dept_id from employees where dept_id in (select dept_id from department) order by dept_id desc ;
--3.	Write a query to display the names (first_name, last_name) and salary for all employees whose salary is not in the range $10,000 through $15,000 and are in department 30 or 100.  
select first_name,last_name,salary from employees where salary between 5000 and 45000 and dept_id=3 or dept_id=8;
--4.	Write a query to display the names (first_name, last_name) whose hire date is not known 
select first_name,last_name ,hire_date from employees where hire_date is null;
--5.	Write a query to display the first_name of all employees who have both "b" and "c" in their first name.  
select first_name from employees where first_name like 'v%' or first_name like 'c%';
--6.	Write a query to display the last name, job, and salary for all employees whose job is that of a Programmer or a Shipping Clerk, and whose salary is not equal to $4,500, $10,000, or $15,000.  
select last_name, salary from employees where salary between 10000 and 900000 and job_id in
(select job_id,job_title from jobs where job_title='developer');
--7.Write a query to display all details of first 5 employees whose salary is less among all employees.
SELECT * FROM employees ORDER BY salary DESC limit 5;
--8.	Write a query to display the jobs/designations available in the employees table. 
select first_name,job_id from employees where job_id in (select job_id , job_title from jobs group by job_title);
 --9.	Write a query to display the names (first_name, last_name), salary and PF (15% of salary) of all employees.  
SELECT first_name, last_name, salary, salary*.15 PF FROM employees;
--10.Write a query to select all record from employees where last name in 'BLAKE', 'SCOTT', 'KING' and 'FORD'.  
select * from employees where last_name in( 'blake', 'scott' , 'ford' , 'king');
