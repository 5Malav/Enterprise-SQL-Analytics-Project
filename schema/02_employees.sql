
create table employees(
    emp_id serial primary key,
    emp_name varchar(100) not null,
    email varchar(100) not null unique,
    dept_id BIGINT UNSIGNED NOT NULL,
    manager_id BIGINT UNSIGNED default null,
    hire_date date not null,
    salary numeric(10,2) not null
);

alter table employees
add constraint fk_emp_dept
foreign key(dept_id) references departments(dept_id);

alter table employees
add constraint fk_emp_manager
foreign key(manager_id) references employees(emp_id);
