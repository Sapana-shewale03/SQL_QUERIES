use Advancedb;
create table customer_test(cust_id int primary key,addr1 varchar(20),addr2 varchar(20),city varchar(10),pincode bigint ,total_req int);
create table employee(emp_id int primary key,age tinyint check(age>0),req_comp varchar(10),emp_rating int);
create table service_status(status_id int primary  key,desc_value varchar(20));
create table service_req(service_id int primary key,service_desc varchar(20),re_open_date date,req_close_da date,cust_id int,
                           status_id int,emp_id int,
                         foreign key(cust_id) references customer_test(cust_id),
						 foreign key(status_id)references service_status(status_id),
						 foreign key(emp_id) references employee(emp_id));
alter table customer_test add cname varchar(10);
alter table service_req add cahrge varchar(10);
alter table employee add ename varchar(20);

--1.Write a query to create Employee table.
create table employee(emp_id int primary key,age tinyint check(age>0),req_comp varchar(10),emp_rating int);

--2.Write a query to add column totalRequests (integer) to customer table (Assume it was not present earlier)
alter table customer  add totalRequests int;
--3.	Write single query to create ReqCopy table which will have same structure and data of service_request table
select * into ReqCopy from service_req;
--4.	Show customer name, service description, charges	of requests served by employees older than age 30. (make use of sub query)
select service_desc , cahrge from service_req where emp_id=(select emp_id from employee where age >=30);
--5.	Write a query to select customer names for whom employee ‘John’ has not served any request.(make use of sub query)
select name from customer_test where cust_id not in(select cust_id from service_req where emp_id=( select emp_id from employee 
where name ='john'));
--6.Show employee name, total charges of all the requests served by that employee. Consider only ‘closed’ requests.
select  ename,cahrge from employee inner join service_req on employee.emp_id=service_req.emp_id
where employee.emp_id in (select emp_id from service_req where status_id=(select status_id from service_status
      where desc_value='closed')) ;
---7.	Show service description, customer name of request having third highest charges.
 select name from customer_test where cust_id = ( select cust_id ,service_desc,cahrge  from service_req  order by cahrge));

 ---8.	Delete all requests served by ‘Sam’ as he has left the company.
select ename,sum(cahrge) from employee e inner join service_req sr on e.emp_id=sr.emp_id inner join service_status ss on sr.status_id=ss.status_id where desc_value='cancelled'
      group by sr.emp_id;
--9.	Delete all cancelled requests from request table
delete from service_status where desc_value='CLOSED';

--10.Update charges of request raised by customer ‘Sony’. Add 10% to the charges if charges are less than 100.
select cahrge from service_req where cust_id=(select cust_id from customer_test where cname='john');


