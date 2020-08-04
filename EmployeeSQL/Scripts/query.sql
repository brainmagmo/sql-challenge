--Once you have a complete database, do the following:
--List the following details of each employee:
--employee number, last name, first name, sex, and salary.
select e.emp_no, e.last_name, e.first_name, e.sex, s.salary
  from employees e
  join salaries s 
    on s.emp_no = e.emp_no;

--List first name, last name, and hire date for
--employees who were hired in 1986.
select first_name, last_name, hire_date
  from employees
 where extract(YEAR from hire_date) = 1986;
--  like '%1986';

--List the manager(S) of each department with the following information:
--department number, department name, the manager's employee number, last name, first name.
select d.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name
  from dept_manager dm
  join departments d
    on dm.dept_no = d.dept_no
  join employees e
    on e.emp_no = dm.emp_no;

--List the department of each employee with the following information:
--employee number, last name, first name, and department name.
create view emp_n_dep AS
------------------------------
select e.emp_no, e.last_name, e.first_name, d.dept_name
  from employees e
  join dept_emp de
    on e.emp_no = de.emp_no
  join departments d 
    on d.dept_no = de.dept_no;


--List first name, last name, and sex for employees 
--whose first name is "Hercules" and last names begin with "B". (moved .)
select first_name, last_name, sex
  from employees
 where first_name = 'Hercules'
   and last_name like 'B%';

--List all employees in the Sales department, including 
--their employee number, last name, first name, and department name.
select emp_no, last_name, first_name, dept_name
  from emp_n_dep 
 where dept_name = 'Sales';

--List all employees in the Sales and Development departments, including 
--their employee number, last name, first name, and department name.
select emp_no, last_name, first_name, dept_name
  from emp_n_dep 
 where dept_name 
    in ('Sales', 'Development');

--In descending order, list the frequency count of employee last names, 
--i.e., how many employees share each last name.
select last_name, count(last_name) 
  from employees
 group by last_name
 order by count(last_name) desc;

--epilogue:
select * from employees where emp_no = 499942;
--they got my birthday wrong! I was born 04/01 ;)