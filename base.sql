select * from products;
select * from product_variant;
select * from product_size;
select * from product_images; --belum
select * from users;
select * from cart;
select * from reviews;
select * from transactions; -- belum
select * from transaction_product;
select * from categories;
select * from product_category;

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


-- Fill tables
insert into products(name, description, quantity, price) values
    ('Espresso', 'Kopi hitam pekat dengan crema tebal', 50, 18000), -- coffee
    ('Americano', 'Espresso dengan tambahan air panas', 45, 20000), -- coffee
    ('Cappuccino', 'Espresso dengan steamed milk dan foam lembut', 40, 25000), -- coffee
    ('Caffe Latte', 'Espresso dengan susu creamy', 42, 25000), -- coffee
    ('Caramel Latte', 'Latte dengan sirup karamel manis', 35, 28000), -- coffee
    ('Vanilla Latte', 'Latte dengan aroma vanilla lembut', 30, 28000), -- coffee
    ('Hazelnut Latte', 'Latte dengan rasa hazelnut gurih', 28, 28000), -- coffee
    ('Mocha', 'Perpaduan espresso, cokelat, dan susu', 32, 30000), -- coffee
    ('Affogato', 'Espresso dengan scoop es krim vanilla', 20, 32000), -- coffee
    ('Cold Brew', 'Kopi seduh dingin dengan rasa smooth', 25, 27000), -- coffee
    ('Matcha Latte', 'Teh hijau Jepang dengan susu creamy', 30, 28000), -- non--coffee
    ('Chocolate', 'Minuman cokelat hangat premium', 35, 26000), -- non--coffee
    ('Taro Latte', 'Minuman taro manis dan creamy', 25, 27000), -- non--coffee
    ('Red Velvet Latte', 'Minuman red velvet lembut', 20, 29000), -- non--coffee
    ('Thai Tea', 'Teh Thailand dengan susu kental manis', 30, 24000), -- non--coffee
    ('Lemon Tea', 'Teh segar dengan perasan lemon', 40, 20000), -- non--coffee
    ('Peach Tea', 'Teh dengan aroma dan rasa peach', 22, 23000), -- non--coffee
    ('Mineral Water', 'Air mineral botol dingin', 60, 10000), -- non--coffee
    ('Croissant Butter', 'Pastry renyah dengan aroma butter', 20, 22000), -- foods
    ('Chocolate Croissant', 'Croissant isi cokelat lumer', 18, 25000), -- foods
    ('Chicken Sandwich', 'Roti isi ayam dan sayur segar', 15, 30000), -- foods
    ('Beef Burger', 'Burger daging sapi dengan saus spesial', 12, 35000), -- foods
    ('French Fries', 'Kentang goreng crispy', 25, 20000), -- foods
    ('Spaghetti Bolognese', 'Pasta dengan saus daging tomat', 14, 38000), -- foods
    ('Chicken Wrap', 'Tortilla isi ayam dan sayuran', 16, 32000), -- foods
    ('Cheese Cake Slice', 'Potongan cheesecake lembut', 10, 30000), -- foods
    ('Extra Shot Espresso', 'Tambahan satu shot espresso', 100, 8000), -- add--on
    ('Syrup Caramel', 'Tambahan sirup karamel', 80, 5000), -- add--on
    ('Syrup Vanilla', 'Tambahan sirup vanilla', 80, 5000), -- add--on
    ('Whipped Cream', 'Tambahan whipped cream lembut', 70, 7000); -- add--on

-- fill product_variant
insert into product_variant(name, add_price) values
    ('ice', 500), ('hot', 0);

-- fill product_size
insert into product_size(name, add_price) values
    ('Regular', 0),
    ('Medium', 4000),
    ('Large', 6000);

-- TODO: fill product

-- fill users
insert into users(full_name, email, password, address, phone, picture) values
    ('Arif Pratama', 'arif.pratama@gmail.com', '1234', 'Jl. Melati No. 12 Jakarta', '081234560001', 'https://placehold.co/200x200'),
    ('Dewi Lestari', 'dewi.lestari@gmail.com', '1234', 'Jl. Kenanga No. 8 Bandung', '081234560002', 'https://placehold.co/200x200'),
    ('Rizky Saputra', 'rizky.saputra@gmail.com', '1234', 'Jl. Mawar No. 21 Surabaya', '081234560003', 'https://placehold.co/200x200'),
    ('Sinta Maharani', 'sinta.maharani@gmail.com', '1234', 'Jl. Anggrek No. 5 Yogyakarta', '081234560004', 'https://placehold.co/200x200'),
    ('Fajar Nugroho', 'fajar.nugroho@gmail.com', '1234', 'Jl. Flamboyan No. 17 Semarang', '081234560005', 'https://placehold.co/200x200'),
    ('Nadia Putri', 'nadia.putri@gmail.com', '1234', 'Jl. Dahlia No. 9 Medan', '081234560006', 'https://placehold.co/200x200'),
    ('Bima Kurniawan', 'bima.kurniawan@gmail.com', '1234', 'Jl. Cempaka No. 14 Bekasi', '081234560007', 'https://placehold.co/200x200'),
    ('Laras Wulandari', 'laras.wulandari@gmail.com', '1234', 'Jl. Teratai No. 3 Depok', '081234560008', 'https://placehold.co/200x200'),
    ('Andika Ramadhan', 'andika.ramadhan@gmail.com', '1234', 'Jl. Bougenville No. 11 Tangerang', '081234560009', 'https://placehold.co/200x200'),
    ('Maya Oktaviani', 'maya.oktaviani@gmail.com', '1234', 'Jl. Sakura No. 6 Bogor', '081234560010', 'https://placehold.co/200x200');

-- fill cart;
insert into cart(user_id, product_id) values
    (1, 3),
    (1, 7),
    (1, 12),
    (2, 5),
    (2, 14),
    (2, 21),
    (3, 1),
    (3, 9),
    (3, 18),
    (4, 2),
    (4, 11),
    (4, 25),
    (5, 4),
    (5, 16),
    (5, 30),
    (6, 6),
    (6, 13),
    (6, 22),
    (7, 8),
    (7, 19),
    (7, 27),
    (8, 10),
    (8, 15),
    (8, 24),
    (9, 17),
    (9, 20),
    (9, 28),
    (10, 23),
    (10, 26),
    (10, 29);

-- fill reviews
insert into reviews(user_id, messages, rating) values
    (1, 'Kopinya enak dan aromanya kuat, pasti order lagi.', 5),
    (2, 'Tempatnya nyaman tapi minumannya agak lama datangnya.', 4),
    (3, 'Rasa matchanya kurang terasa, mungkin bisa ditingkatkan.', 3),
    (4, 'Pelayanannya ramah dan cepat, sangat puas.', 5),
    (5, 'Harga sedikit mahal tapi kualitas sesuai.', 4),
    (6, 'Kopi terlalu pahit untuk selera saya.', 2),
    (7, 'Makanannya enak tapi minuman kurang dingin.', 3),
    (8, 'Pelayanan kurang responsif saat ramai.', 2),
    (9, 'Suka banget sama caramel lattenya, recommended!', 5),
    (10, 'Overall oke, tapi tempat parkir agak sempit.', 4);

-- todo: fill transactions
insert into transactions(delivery_method, full_name, email, address, sub_total, tax, total, status, payment_method) values


-- todo: fill transaction_product (perlu isi tabel transactions dulu)
insert into transaction_product(product_id, transaction_id, quantity, size_id, variant_id, price) values
    (1, 1, 2, 1, 1, 37000),
    (2, 2, 1, 2, 2, 24000),
    (3, 3, 3, 3, 1, 94500),
    (4, 4, 1, 1, 3, 25000),
    (5, 5, 2, 2, 2, 64000),
    (6, 6, 1, 3, 3, 34000),
    (7, 7, 4, 1, 1, 114000),
    (8, 8, 2, 2, 2, 68000),
    (9, 9, 1, 3, 1, 38500),
    (10,10, 2, 1, 3, 54000),
    (1, 11, 1, 2, 2, 22000),
    (3, 12, 2, 3, 3, 62000),
    (5, 13, 1, 1, 1, 28500),
    (7, 14, 3, 2, 2, 96000),
    (9, 5, 2, 3, 3, 76000);