create table sales(
    sales_id BIGINT UNSIGNED AUTO_INCREMENT primary key,
    emp_id BIGINT UNSIGNED not null,
    order_id BIGINT UNSIGNED not null,
    sale_amount numeric(10,2) not null
);

alter table sales
add constraint fk_sales_emp
foreign key(emp_id) references employees(emp_id);

alter table sales
add constraint fk_sales_order
foreign key(order_id) references orders(order_id);