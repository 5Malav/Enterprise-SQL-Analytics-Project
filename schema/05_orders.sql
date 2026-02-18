create table orders(
    order_id BIGINT UNSIGNED AUTO_INCREMENT primary key,
    customer_id BIGINT UNSIGNED not null,
    order_date date not null,
    status varchar(20) not null
);

alter TABLE orders
add constraint fk_order_customer
foreign key(customer_id) references customers(customer_id);