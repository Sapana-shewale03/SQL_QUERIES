use Advancedb;
create table stud(roll_no int primary key,sname varchar(20),city varchar(10),tname varchar(10),percentage int);
select * from stud;
select roll_no,sname from stud;
select * from stud where tname='deepa' and  percentage>=50;
select * from stud where percentage=85 or tname ='jayshree';
select * from stud where roll_no not in(5,7,10);
select * from stud where roll_no in(5,7,10);
select * from stud where percentage<70 and percentage>50;
select * from stud where percentage  between 50 and 70;
select distinct tname from stud;
select * from stud where tname is null and city is not null;
select * from stud where sname like '__n__';--%a or a%_a_
select * from stud  order by city ;
select * from stud  order by city desc;
alter table stud alter column city varchar(10) not null;
alter table stud add shoenumber int;
sp_help stud;
alter table stud drop column shoenumber;
insert into stud values(16,'mihir','hudco','divya',56);
insert into stud (roll_no,sname,city) values( 17,'hitesh','shanti' )
update stud set city ='delhhi' where roll_no=8;
update stud set percentage = 12 where sname='pooja';
delete from stud where city='nasik';