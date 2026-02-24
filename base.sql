create table products (
    
)

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
    path varchar(200)
);

create table reviews (
    id serial PRIMARY KEY,
    messages varchar(600),
    rating int
);

-- TODO:
create table cart (
    id serial PRIMARY KEY,
    user_id int,
    products_id int
    constraint fk_user
        foreign key(user_id)
        references users(id),
    constraint fk_products
        foreign key(products_id)
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

create table transactions (
    id string PRIMARY KEY,
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
    product_id int FOREIGN KEY,
    transaction_id string FOREIGN KEY,
    quantity int,
    size_id int FOREIGN KEY,
    variant_id int FOREIGN KEY,
    price int
)