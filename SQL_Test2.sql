use Advancedb;
create table teacher(teacher_id int primary key,tname varchar(20)); 
create table batch(batch_id int primary key,batch_name varchar(20),teacher_id int constraint fktid foreign key(teacher_id)
references teacher(teacher_id));
create table status(status_id int primary key,status_desc varchar(20));
create table student1(stud_id int primary key,sname varchar(20),mobile varchar(10),batch_id int constraint fkbid foreign
key(batch_id) references batch(batch_id),status_id int constraint fksid foreign key(status_id) references status(status_id),
year_of_pass date);
create table attendance(stud_id int constraint fkssid foreign key(stud_id) references student1(stud_id),adate date,present
varchar(1));
create table score2(test_date date,
topic varchar(10),marks_obtain int,stud_id int constraint PK_ste PRIMARY KEY(stud_id,test_date));
select * from score2;
sp_help teacher;
--1. Write a query to create Student and Score table. 
--for student
create table student1(stud_id int primary key,sname varchar(20),mobile varchar(10),batch_id int constraint fkbid foreign
key(batch_id) references batch(batch_id),status_id int constraint fksid foreign key(status_id) references status(status_id),
year_of_pass date);
--for score
create table score1(stud_id int ,test_date date,
topic varchar(10),marks_obtain int,CONSTRAINT PK_sturde PRIMARY KEY(stud_id,test_date));

--2.	Write a query to add column Qualification to Student table. ( Assume it was not present earlier)– 
--add qualification column after status id
alter table  student1 add qulification varchar(20);
--3.Write single query to create StudentCopy table which will have same structure and data of table.
select * into studentcopy from student1;
--4.List all studentsname from july2018 who were absent for test on 18Aug2018.
  select sname from student1 INNER JOIN attendance on student1.stud_id=attendance.stud_id where present='a'; 
  --5.	Update record of student Mithilesh from July2018 batch to Aug2018. Batch id of both batches is not known.
  update batch set batch_name='aug 2018' where batch_name='july 2018';
  --6.	Assume there is field ‘student_count’ in batch table. Write a query to update this field by counting no of 
  --students in that batch.
  select count(*) from batch where batch_name='student_count';
  --7.	List all Students from July2018 whose qualification is “BE” and year of passing is 2018.
	alter table student1 drop column year_of_pass;       
	alter table  student1 add year_of_pass1 int;
	   select * from student1 where qulification='BE' and year_of_pass1='2018';
--8.List student name ,topic and topic wise marks of each student from July2018 batch.
select topic,marks_obtain from score2 where stud_id in (select stud_id,sname from student1 where batch_id in (select batch_id from batch where 
 batch_name='july 2018'));
 --9.Display batchname and Batchwise Placed student count for all batches from which less than 5 students are placed.
 select batch_name,count(*) as "batchsidj" from batch group by batch_name;
--10.	Display top 3 students from july2018 batch with least attendance.
 select present from attendance where present=least('a','p') and stud_id in(select sname from student1 where batch_id in(select
 batch_id,batch_name from batch where batch_name='july 2018'));
 --11.	Delete all records of those students from attendance who are ‘PLACED’
 delete from  attendance  where stud_id in (select stud_id from student1 where status_id in(select status_id
 from status where status_desc='placed'));
 --12.	Delete all records of students whose average marks are less than 50.
 delete from student1 where stud_id in(select stud_id from score2 where marks_obtain<50);
 --13.	Create a view to which shows sid name batchname. 
 create view sidbatchname 
 as select stud_id from student1 where batch_id in ( select batch_name from batch);
 --14.	Create index so that retrieval of records is faster when retrieved based on status id
  create index statusindx on status(status_id);
  --15.	Give one example of left outer join using above database.
  select sname from student1 left join score2 on student1.stud_id=score2.stud_id;
   



