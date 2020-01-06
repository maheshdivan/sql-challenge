------------1--------------
select e.emp_no,e.first_name,e.last_name,e.gender,s.salary from employee e inner join salaries s
on e.emp_no=s.emp_no;
------------2-----------------
select emp_no,first_name,last_name from employee where date_trunc('year',hire_date)='1986-01-01';
------------3-----------------
select d.dept_id,d.dept_name,dm.emp_no,e.first_name,e.last_name,dm.from_date,dm.to_date
from departments d join dept_manager dm on d.dept_id=dm.dept_id join employee e
on dm.emp_no=e.emp_no;
------------4-----------------
select e.emp_no,e.last_name,e.first_name,d.dept_name
from departments d join dept_employee de on d.dept_id = de.dept_id join employee e
on de.emp_no = e.emp_no;
------------5-----------------
select emp_no,first_name,last_name from employee 
where first_name = 'Hercules' and last_name like 'B%';
------------6-----------------
select e.emp_no,e.last_name,e.first_name,d.dept_name
from employee e join dept_employee de
on e.emp_no=de.emp_no
and de.dept_id in 
(select dept_id from departments where dept_name='Sales')
inner join departments d on d.dept_id in 
(select dept_id from departments where dept_name='Sales');
------------7-------------------
select e.emp_no,e.last_name,e.first_name,d.dept_name
from employee e join dept_employee de
on e.emp_no=de.emp_no
and de.dept_id in 
(select dept_id from departments where dept_name='Development')
inner join departments d on d.dept_id in 
(select dept_id from departments where dept_name='Development')
union
select e.emp_no,e.last_name,e.first_name,d.dept_name
from employee e join dept_employee de
on e.emp_no=de.emp_no
and de.dept_id in 
(select dept_id from departments where dept_name='Sales')
inner join departments d on d.dept_id in 
(select dept_id from departments where dept_name='Sales');
---------------------8-------------------------------

select last_name as "LAST_NAME",count(last_name) as "Frequency" 
from employee
group by last_name
order by 2 desc;
