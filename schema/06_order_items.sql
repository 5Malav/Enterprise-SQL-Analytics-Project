create table order_items(
    order_item_id BIGINT UNSIGNED AUTO_INCREMENT primary key,
    order_id BIGINT UNSIGNED not null,
    product_id BIGINT UNSIGNED not null,
    quantity int not null
);

alter table order_items
add constraint fk_item_order
foreign key(order_id) references orders(order_id);

alter table order_items
add constraint fk_item_product
foreign key(product_id) references products(product_id);