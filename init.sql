-- create the category table
CREATE TABLE IF NOT EXISTS CATEGORY(
category_id int auto_increment primary key,
name        varchar(255) null
);

-- insert default categories
INSERT IGNORE INTO CATEGORY(name) VALUES ('Fruits'),
                                  ('Vegetables'),
                                  ('Meat'),
                                  ('Fish'),
                                  ('Dairy'),
                                  ('Bakery'),
                                  ('Drinks'),
                                  ('Sweets'),
                                  ('Other');

-- create the customer table
CREATE TABLE IF NOT EXISTS CUSTOMER(
id       int auto_increment primary key,
address  varchar(255) null,
email    varchar(255) null,
password varchar(255) null,
role     varchar(255) null,
username varchar(255) unique
);

-- insert default customers
INSERT IGNORE INTO CUSTOMER(address, email, password, role, username) VALUES
('123, Albany Street', 'admin@nyan.cat', '123', 'ROLE_ADMIN', 'admin'),
('765, 5th Avenue', 'lisa@gmail.com', '765', 'ROLE_NORMAL', 'lisa');

-- create the product table
CREATE TABLE IF NOT EXISTS PRODUCT(
product_id  int auto_increment primary key,
description varchar(255) null,
image       varchar(1000) null,
name        varchar(255) null,
price       int null,
quantity    int null,
weight      int null,
category_id int null,
customer_id int null
);

-- insert default products
INSERT IGNORE INTO PRODUCT(description, image, name, price, quantity, weight, category_id) VALUES
('Fresh and juicy', 'https://images.unsplash.com/photo-1567306226416-28f0efdc88ce?w=500', 'Apple', 3, 40, 76, 1),
('Cage-free organic eggs', 'https://images.unsplash.com/photo-1587486913049-53fc88980cfc?w=500', 'Eggs', 4, 90, 43, 5),
('Fresh whole milk', 'https://images.unsplash.com/photo-1563636619-e9143da7973b?w=500', 'Milk', 2, 60, 1000, 5),
('Whole wheat loaf', 'https://images.unsplash.com/photo-1509440159596-0249088772ff?w=500', 'Bread', 3, 50, 500, 6);

-- create the cart table
CREATE TABLE IF NOT EXISTS CART(
id          int auto_increment primary key,
customer_id int null,
FOREIGN KEY (customer_id) REFERENCES CUSTOMER(id)
);

-- create the cart_product join table
CREATE TABLE IF NOT EXISTS CART_PRODUCT(
cart_id    int not null,
product_id int not null,
PRIMARY KEY (cart_id, product_id),
FOREIGN KEY (cart_id) REFERENCES CART(id),
FOREIGN KEY (product_id) REFERENCES PRODUCT(product_id)
);

-- create indexes
CREATE INDEX IF NOT EXISTS FK7u438kvwr308xcwr4wbx36uiw ON PRODUCT (category_id);
CREATE INDEX IF NOT EXISTS FKt23apo8r9s2hse1dkt95ig0w5 ON PRODUCT (customer_id);
