use hr;
begin tran
delete jobs;
rollback tran;
select * from jobs;
select getDate();
select DATEPART(mm,getdate());
select DATEADD(day,10,getdate());
select DATEDIFF(year,'2018-10-23',getdate());
select DATEDIFF(mm,'2018-10-23',getdate());select DATEDIFF(day,'2018-10-23',getdate());
select lower(first_name),upper(last_name) from employees;
select len(' sapana'),len(trim('   sapna'));
select CONCAT('Mr ',first_name,' ',last_name) as fullname from employees;
select SUBSTRING('thinkquoetient',3,5);
select char(65);
select ASCII('a');

begin try
begin tran
update jobs set job_title='vice-president' where job_id=4;
--insert into jobs values ('mr',4545,454545);
commit tran;
end try
begin catch
select ERROR_MESSAGE();
rollback tran;
end catch;