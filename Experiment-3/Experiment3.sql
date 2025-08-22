--EASY PROBLEM--

create table employees (
    id int
);
INSERT INTO employees VALUES (2),(4),(4),(6),(6),(7),(8),(8);

select max(id) as emp_id  
from employees  
where id not in (
    select id 
    from employees 
    group by id 
    having count(*) > 1
);


--MEDIUM PROMBLEM--

CREATE TABLE department (
    id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

-- Create Employee Table
CREATE TABLE employee (
    id INT,
    name VARCHAR(50),
    salary INT,
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES department(id)
);
-- Insert into Department Table
INSERT INTO department (id, dept_name) VALUES
(1, 'IT'),
(2, 'SALES');
-- Insert into Employee Table
INSERT INTO employee (id, name, salary, department_id) VALUES
(1, 'JOE', 70000, 1),
(2, 'JIM', 90000, 1),
(3, 'HENRY', 80000, 2),
(4,'SAM',60000,2),
(5,'MAX',90000,1);

select d.dept_name,e.name,e.salary,d.id
from employee as e


inner join
department as d
on
e.department_id=d.id
where e.salary in(
select max(e2.salary)
from employee as e2
where e2.department_id=e.department_id)
order by d.id


--HARD PROBLEM --
create table a (
	empid int primary key,
	ename varchar(23),
	salary int
	);

create table b (
	empid int primary key,
	ename varchar(23),
	salary int
	);

insert into a (empid, ename, salary) values
(1, 'aa', 1000),
(2, 'bb', 300);

insert into b (empid, ename, salary) values
(2, 'bb', 400),
(3, 'cc', 100);

select empid, ename, min(salary)
from
(
select * from a
union all
select * from b

) as intermediate_result 
group by empid, ename