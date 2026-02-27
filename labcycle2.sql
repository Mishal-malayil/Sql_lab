

 create database company;


 use company;

create table regions(
    -> region_id int primary key
    -> ,region_name varchar(50) not null);


 create table countries(
    -> country_id varchar(5) primary key,
    -> country_name varchar(50) not null ,
    -> region_id int , foreign key (region_id)references regions(region_id));


 create table locations(
    -> location_id int primary key,
    -> street_address varchar (100),
    -> postal_code varchar(20),
    -> state_province varchar(50),
    -> country_id varchar(50),foreign key(country_id)references countries(country_id));


 create table department(
    -> dept_id int primary key,
    -> dept_name varchar(50),
    -> location_id int , foreign key(location_id)references locations(location_id));



 create table jobs( job_id varchar(10) primary key, job_title varchar(50), min_salary decimal (10,2), max_salary decimal (10,2) );


 create table employees(
    -> employee_id int primary key,
    -> first_name varchar(50),
    -> last_name varchar(50),
    -> email varchar(100),
    -> phone_no varchar(20),
    -> hire_date date,
    -> job_id varchar(10),
    -> salary decimal(10,2),
    -> manager_id int,
    -> dept_id int,
    -> foreign key(job_id)references jobs(job_id),
    -> foreign key(manager_id)references employees(employee_id),
    -> foreign key(dept_id)references department(dept_id));



 create table dependents( dependent_id int primary key, first_name varchar(50), last_name varchar(50), relationship varchar(50), employee_id int ,foreign key(employee_id)references employees(employee_id));


 insert into regions values(1,'Asia'),
    -> (2,'Europe');



 insert into countries values('IN','India',1), ('UK','United Kindom',2);



 describe locations;




 alter table locations add column city varchar(50);


 describe locations;



 insert into locations values(1700,'Mg Road','5600061','Karnataka','IN','banglore'), (1800,'Oxford','w1','London','UK','London');


 describe locations;


 insert into department values(
    -> 1,'IT',1700),
    -> (2,'HR',1700),
    -> (3,'Finance',1800),
    -> (4,'Marketing',1800);

 insert into jobs values ('IT_PROG','programmer',5000,20000),  ('HR_REP','HR Representive',4000,15000),  ('FIN_ACC','Accountant',6000,18000),  ('MRT_MAN','Marketing',8000,25000);

 insert into employees values (101,'Rahul','sharma','rahul@gmail.com','999991','2022-01-10','IT_PROG','15000',NULL,1), (102,'Aisha','Khan','aisha@gmail.com','999992','2021-01-12','HR_REP','9000','101',2), (103,'John','smith','johnsmith@gmail.com','999993','2020-03-15','FIN_ACC','12000','101',3), (104,'Priya','nair','priya@gmail.com','999994','2023-04-18','IT_PROG','7000','101',1), (105,'david','brown','david@gmail.com','999995','2022-05-20','MRT_MAN','22000','103',4);


 insert into dependents values
    -> (1,'Anu','sharma','Daughter',101),
    -> (2,'sara','khan','wife',102);


 select first_name ,last_name from employees join department using (dept_id) where location_id=1700;


 select first_name ,last_name from employees join department using (dept_id) where location_id<>1700;


 select *from employees
    -> where salary=(select MAX(salary) from employees);


select first_name,last_name from employees join department using(dept_id) where location_id =1700;


select first_name,last_name from employees join department using(dept_id) where location_id <>1700;


select * from employees where salary=(select MAX(salary)from employees);


select * from employees where salary>(select AVG(salary)from employees);

select distinct dept_id,dept_name from department join employees using(dept_id) where salary > 1000;


select dept_id,dept_name from department where dept_id NOT IN (select dept_id from employees where salary>100);


select dept_id,dept_name from department where dept_id NOT IN (select dept_id from employees where salary>1000);


select * from employees where salary>ALL(select MIN(salary) from employees group by dept_id);


select * from employees where salary>=ALL(select MIN(salary) from employees group by dept_id);


select AVG (avg_salary) from (select AVG(salary) AS avg_salary from employees group by dept_id) AS dept_avg;



select first_name,salary,(select AVG (salary)from employees) AS avg_salary,salary -(select AVG(salary)from employees) AS different from employees;



select * from employees e where salary>(select AVG(salary) from employees where dept_id=e.dept_id);



describe dependents;



select * from employees e where not exists(select * from dependents d where d.employee_id = e.employee_id);


select e.first_name,e.last_name,d.dept_name from employees e join department d on e.dept_id=d.dept_id where e.dept_id in (1,2,3);


select e.first_name,e.last_name,j.job_title,d.dept_name from employees e join jobs j on e.job_id=j.job_id join department d on e.dept_id=d.dept_id where e.dept_id in (1,2,3) AND e.salary>10000;


 select d.dept_name,
    -> l.street_address,l.postal_code,
    -> c.country_name,
    -> r.region_name
    -> from department d
    -> join locations l
    -> on d.location_id=l.location_id
    -> join countries c
    -> on l.country_id=c.country_id
    -> join regions r
    -> on c.region_id=r.region_id;



 describe employees;


select e.first_name,e.last_name,e.dept_id,d.dept_name from employees e left join department d on e.dept_id = d.dept_id;


select e.first_name,e.last_name,d.dept_name,l.city,l.state_province from employees e join department d on e.dept_id=d.dept_name join locations l on d.location_id=l.location_id where e.first_name like '%Z';


select e.first_name,e.last_name,d.dept_id,d.dept_name from department d left join employees e on d.dept_id=e.dept_id;


select e.first_name as employee_name,
    -> m.first_name as manager_name from employees e left join employees m on e.manager_id =m.employee_id;


select first_name,last_name,dept_id from employees where dept_id=(select dept_id from employees where last_name='Taylor');


use company;

select j.job_title,e.first_name,(j.max_salary)AS salary_difference from employees e join jobs j on e.job_id=j.job_id;



alter table employees add commission decimal(10,2)after salary;


describe employees;


update employees set commission = 1000 where employee_id = 101;


update employees set commission = 1800 where employee_id = 102;


update employees set commission = 1500 where employee_id = 103;


update employees set commission = 800 where employee_id = 104;


update employees set commission = 3000 where employee_id = 105;


select * from employees;



select d.dept_name,avg(e.salary)as avg_salary ,count(e.commission)as commission_count from department d left join employees e on d.dept_id=e.dept_id group by d.dept_name;



create view banglore_emp AS select e.emp_id,e.first_name,e.phone_no,j.job_title,d.dept_name,m.first_name AS manager_name from employees e
    -> join jobs j on e.job_id=j.job_id
    -> join departments d on e.dept_id=d.dept_id
    -> join locations l on d.location_id=l.location_id
    -> left join employees m on 
    -> e.manager_id=m.employee_id
    -> where l.city='bangalore';


select * from banglore_emp;                                                                                                      



create view delhi_emp as select e.employee_id,e.first_name,e.phone_no,j.job_title,d.dept_name,m.first_name as manager_name from employees                                                                                                    oyees


select first_name from delhi_emp where job_title='manager' and dept_name='finance';                                                 


select first_name from delhi_emp where job_title='programmer' and dept_name='IT';




update employees set phone_no='9995683020' where first_name = 'Aisha';


select * from delhi_emp;

select * from employees e where not exists(select * from dependents d where d.employee_id=e.employee_id);


select * from employees where manager_id =101 union select * from employees where manager_id=201;


select * from employees where manager_id =101 union select * from employees where manager_id=103;


select * from employees e where exists (select * from dependents d where d.employee_id=e.employee_id);





