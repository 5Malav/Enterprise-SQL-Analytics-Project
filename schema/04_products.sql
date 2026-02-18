create table products(
    product_id BIGINT UNSIGNED AUTO_INCREMENT primary key,
    product_name varchar(100) not null,
    category varchar(100) not null,
    price numeric(10,2) not null
);