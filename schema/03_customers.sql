create table customers(
    customer_id BIGINT UNSIGNED AUTO_INCREMENT primary key,
    customer_name varchar(100) not null,
    email varchar(150) unique,
    signup_date date not null
);