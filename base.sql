select * from products;
select * from product_variant;
select * from product_size;
select * from product_images;
select * from users;
select * from cart;
select * from reviews;
select * from transactions;
select * from transaction_product;

create table products (
    id serial primary key,
    name varchar(30),
    description varchar(200),
    quantity int,
    price int
);

CREATE TABLE product_variant (
    id serial PRIMARY KEY,
    name varchar(20) not null,
    add_price int
);

create table product_size (
    id serial PRIMARY KEY,
    name varchar(20),
    add_price int
);

create table product_images (
    id serial PRIMARY KEY,
    product_id int not null,
    path varchar(200),
    constraint fk_product
        foreign key(product_id)
        references products(id)
);


create table users (
    id serial PRIMARY KEY,
    full_name varchar(80),
    email varchar(25) UNIQUE NOT NULL,
    password varchar(80),
    address varchar(80),
    phone varchar(16),
    picture varchar(120),
    created_at TIMESTAMP DEFAULT now()
);

create table cart (
    id serial PRIMARY KEY,
    user_id int,
    product_id int,
    constraint fk_user
        foreign key(user_id)
        references users(id),
    constraint fk_products
        foreign key(product_id)
        references products(id)
);

create table reviews (
    id serial PRIMARY KEY,
    user_id int,
    messages varchar(600),
    rating int,
    constraint users
        foreign key(user_id)
        references users(id)
);

create table transactions (
    id varchar(20) PRIMARY KEY,
    delivery_method varchar(60),
    full_name varchar(80),
    email varchar(25),
    address varchar(80),
    sub_total int,
    tax int,
    total int,
    date TIMESTAMP DEFAULT now(),
    status varchar(10),
    payment_method varchar(20)
);

create table transaction_product (
    id serial PRIMARY KEY,
    product_id int,
    transaction_id varchar(20),
    quantity int,
    size_id int,
    variant_id int,
    price int,
    constraint fk_product
        foreign key(product_id)
        references products(id),
    constraint fk_transaction
        foreign key(transaction_id)
        references transactions(id),
    constraint fk_product_size
        foreign key(size_id)
        references product_size(id),
    constraint fk_variant
        foreign key(variant_id)
        references product_variant(id)
);

create table categories (
    id serial primary key,
    name varchar(80)
);

create table product_category (
    id serial primary key,
    product_id int,
    category_id int,
    constraint product
        foreign key(product_id)
        references products(id),
    constraint category
        foreign key(category_id)
        references categories(id)
);