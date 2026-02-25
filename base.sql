select * from products;
select * from product_variant;
select * from product_size;
select * from product_images;
select * from users;
select * from cart;
select * from reviews;
select * from transactions;
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
-- ubah tipe data kolom status di tabel transactions
alter table transactions
alter column status type varchar(15);

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


-- Fill products
insert into products(name, description, quantity, price) values
    ('Espresso', 'Kopi hitam pekat dengan crema tebal', 50, 18000),
    ('Americano', 'Espresso dengan tambahan air panas', 45, 20000),
    ('Cappuccino', 'Espresso dengan steamed milk dan foam lembut', 40, 25000),
    ('Caffe Latte', 'Espresso dengan susu creamy', 42, 25000),
    ('Caramel Latte', 'Latte dengan sirup karamel manis', 35, 28000),
    ('Vanilla Latte', 'Latte dengan aroma vanilla lembut', 30, 28000),
    ('Hazelnut Latte', 'Latte dengan rasa hazelnut gurih', 28, 28000),
    ('Mocha', 'Perpaduan espresso, cokelat, dan susu', 32, 30000),
    ('Affogato', 'Espresso dengan scoop es krim vanilla', 20, 32000),
    ('Cold Brew', 'Kopi seduh dingin dengan rasa smooth', 25, 27000),
    ('Matcha Latte', 'Teh hijau Jepang dengan susu creamy', 30, 28000),
    ('Chocolate', 'Minuman cokelat hangat premium', 35, 26000),
    ('Taro Latte', 'Minuman taro manis dan creamy', 25, 27000),
    ('Red Velvet Latte', 'Minuman red velvet lembut', 20, 29000),
    ('Thai Tea', 'Teh Thailand dengan susu kental manis', 30, 24000),
    ('Lemon Tea', 'Teh segar dengan perasan lemon', 40, 20000),
    ('Peach Tea', 'Teh dengan aroma dan rasa peach', 22, 23000),
    ('Mineral Water', 'Air mineral botol dingin', 60, 10000),
    ('Croissant Butter', 'Pastry renyah dengan aroma butter', 20, 22000),
    ('Chocolate Croissant', 'Croissant isi cokelat lumer', 18, 25000),
    ('Chicken Sandwich', 'Roti isi ayam dan sayur segar', 15, 30000),
    ('Beef Burger', 'Burger daging sapi dengan saus spesial', 12, 35000),
    ('French Fries', 'Kentang goreng crispy', 25, 20000),
    ('Spaghetti Bolognese', 'Pasta dengan saus daging tomat', 14, 38000),
    ('Chicken Wrap', 'Tortilla isi ayam dan sayuran', 16, 32000),
    ('Cheese Cake Slice', 'Potongan cheesecake lembut', 10, 30000),
    ('Extra Shot Espresso', 'Tambahan satu shot espresso', 100, 8000),
    ('Syrup Caramel', 'Tambahan sirup karamel', 80, 5000),
    ('Syrup Vanilla', 'Tambahan sirup vanilla', 80, 5000),
    ('Whipped Cream', 'Tambahan whipped cream lembut', 70, 7000);

-- fill product_variant
insert into product_variant(name, add_price) values
    -- ('ice', 500), ('hot', 0);
    

-- fill product_size
insert into product_size(name, add_price) values
    ('Regular', 0),
    ('Medium', 4000),
    ('Large', 6000);

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

-- fill transactions
insert into transactions (id, delivery_method, full_name, email, address, sub_total, tax, total, status, payment_method) values
('TRX-2026-02-001', 'Dine In', 'Arif Pratama', 'arif.pratama@gmail.com', 'Jl. Melati No. 12 Jakarta', 37000, 3700, 40700, 'Finish Order', 'Bank BRI'),
('TRX-2026-02-002', 'Pick Up', 'Dewi Lestari', 'dewi.lestari@gmail.com', 'Jl. Kenanga No. 8 Bandung', 24000, 2400, 26400, 'Finish Order', 'DANA'),
('TRX-2026-02-003', 'Door Delivery', 'Rizky Saputra', 'rizky.saputra@gmail.com', 'Jl. Mawar No. 21 Surabaya', 94500, 9450, 103950, 'Sending Goods', 'Bank BCA'),
('TRX-2026-02-004', 'Dine In', 'Sinta Maharani', 'sinta.maharani@gmail.com', 'Jl. Anggrek No. 5 Yogyakarta', 25000, 2500, 27500, 'Finish Order', 'Gopay'),
('TRX-2026-02-005', 'Door Delivery', 'Fajar Nugroho', 'fajar.nugroho@gmail.com', 'Jl. Flamboyan No. 17 Semarang', 140000, 14000, 154000, 'On Progress', 'OVO'),
('TRX-2026-02-006', 'Pick Up', 'Nadia Putri', 'nadia.putri@gmail.com', 'Jl. Dahlia No. 9 Medan', 34000, 3400, 37400, 'Finish Order', 'Paypal'),
('TRX-2026-02-007', 'Dine In', 'Bima Kurniawan', 'bima.kurniawan@gmail.com', 'Jl. Cempaka No. 14 Bekasi', 114000, 11400, 125400, 'Sending Goods', 'Bank BRI'),
('TRX-2026-02-008', 'Door Delivery', 'Laras Wulandari', 'laras.wulandari@gmail.com', 'Jl. Teratai No. 3 Depok', 68000, 6800, 74800, 'On Progress', 'DANA'),
('TRX-2026-02-009', 'Pick Up', 'Andika Ramadhan', 'andika.ramadhan@gmail.com', 'Jl. Bougenville No. 11 Tangerang', 38500, 3850, 42350, 'Finish Order', 'Gopay'),
('TRX-2026-02-010', 'Dine In', 'Maya Oktaviani', 'maya.oktaviani@gmail.com', 'Jl. Sakura No. 6 Bogor', 54000, 5400, 59400, 'Finish Order', 'Bank BCA'),
('TRX-2026-02-011', 'Door Delivery', 'Arif Pratama', 'arif.pratama@gmail.com', 'Jl. Melati No. 12 Jakarta', 22000, 2200, 24200, 'On Progress', 'OVO'),
('TRX-2026-02-012', 'Pick Up', 'Dewi Lestari', 'dewi.lestari@gmail.com', 'Jl. Kenanga No. 8 Bandung', 62000, 6200, 68200, 'Sending Goods', 'Paypal'),
('TRX-2026-02-013', 'Dine In', 'Rizky Saputra', 'rizky.saputra@gmail.com', 'Jl. Mawar No. 21 Surabaya', 28500, 2850, 31350, 'Finish Order', 'Bank BRI'),
('TRX-2026-02-014', 'Door Delivery', 'Sinta Maharani', 'sinta.maharani@gmail.com', 'Jl. Anggrek No. 5 Yogyakarta', 96000, 9600, 105600, 'On Progress', 'DANA');

-- fill transaction_product (perlu isi tabel transactions dulu)
insert into transaction_product(product_id, transaction_id, quantity, size_id, variant_id, price) values
(1,  'TRX-2026-02-001', 2, 1, 1, 37000),
(2,  'TRX-2026-02-002', 1, 2, 2, 24000),
(3,  'TRX-2026-02-003', 3, 3, 1, 94500),
(4,  'TRX-2026-02-004', 1, 1, 2, 25000),
(5,  'TRX-2026-02-005', 2, 2, 2, 64000),
(6,  'TRX-2026-02-006', 1, 3, 1, 34000),
(7,  'TRX-2026-02-007', 4, 1, 1, 114000),
(8,  'TRX-2026-02-008', 2, 2, 2, 68000),
(9,  'TRX-2026-02-009', 1, 3, 1, 38500),
(10, 'TRX-2026-02-010', 2, 1, 2, 54000),
(1,  'TRX-2026-02-011', 1, 2, 2, 22000),
(3,  'TRX-2026-02-012', 2, 3, 1, 62000),
(5,  'TRX-2026-02-013', 1, 1, 1, 28500),
(7,  'TRX-2026-02-014', 3, 2, 2, 96000),
(9,  'TRX-2026-02-005', 2, 3, 2, 76000);

insert into categories(name) values
        ('Favourite Product'),
        ('Coffee'),
        ('Non-Coffee'),
        ('Foods'),
        ('Add-On');

insert into product_category(product_id, category_id) values
    (1, 2),
    (2, 2),
    (3, 2), (3, 1),
    (4, 2),
    (5, 2),
    (6, 2), (6, 1),
    (7, 2),
    (8, 2),
    (9, 2),
    (10, 2),

    (11, 3),
    (12, 3),
    (13, 3),
    (14, 3),
    (15, 3),
    (16, 3),
    (17, 3),
    (18, 3),

    (19, 4), (19, 3),
    (20, 4), (20, 3),
    (21, 4), (21, 3),
    (22, 4), (22, 3),
    (23, 4), (23, 3),
    (24, 4), (24, 3),
    (25, 4), (25, 3),
    (26, 4), (26, 3),

    (27, 5),
    (28, 5),
    (29, 5),
    (30, 5);

-- fill product_images
insert into product_images(product_id, path) values
(1, 'https://placehold.co/600x600'),
(1, 'https://placehold.co/600x600'),
(1, 'https://placehold.co/600x600'),

(2, 'https://placehold.co/600x600'),
(2, 'https://placehold.co/600x600'),
(2, 'https://placehold.co/600x600'),

(3, 'https://placehold.co/600x600'),
(3, 'https://placehold.co/600x600'),
(3, 'https://placehold.co/600x600'),

(4, 'https://placehold.co/600x600'),
(4, 'https://placehold.co/600x600'),
(4, 'https://placehold.co/600x600'),

(5, 'https://placehold.co/600x600'),
(5, 'https://placehold.co/600x600'),
(5, 'https://placehold.co/600x600'),

(6, 'https://placehold.co/600x600'),
(6, 'https://placehold.co/600x600'),
(6, 'https://placehold.co/600x600'),

(7, 'https://placehold.co/600x600'),
(7, 'https://placehold.co/600x600'),
(7, 'https://placehold.co/600x600'),

(8, 'https://placehold.co/600x600'),
(8, 'https://placehold.co/600x600'),
(8, 'https://placehold.co/600x600'),

(9, 'https://placehold.co/600x600'),
(9, 'https://placehold.co/600x600'),
(9, 'https://placehold.co/600x600'),

(10, 'https://placehold.co/600x600'),
(10, 'https://placehold.co/600x600'),
(10, 'https://placehold.co/600x600'),

(11, 'https://placehold.co/600x600'),
(11, 'https://placehold.co/600x600'),
(11, 'https://placehold.co/600x600'),

(12, 'https://placehold.co/600x600'),
(12, 'https://placehold.co/600x600'),
(12, 'https://placehold.co/600x600'),

(13, 'https://placehold.co/600x600'),
(13, 'https://placehold.co/600x600'),
(13, 'https://placehold.co/600x600'),

(14, 'https://placehold.co/600x600'),
(14, 'https://placehold.co/600x600'),
(14, 'https://placehold.co/600x600'),

(15, 'https://placehold.co/600x600'),
(15, 'https://placehold.co/600x600'),
(15, 'https://placehold.co/600x600'),

(16, 'https://placehold.co/600x600'),
(16, 'https://placehold.co/600x600'),
(16, 'https://placehold.co/600x600'),

(17, 'https://placehold.co/600x600'),
(17, 'https://placehold.co/600x600'),
(17, 'https://placehold.co/600x600'),

(18, 'https://placehold.co/600x600'),
(18, 'https://placehold.co/600x600'),
(18, 'https://placehold.co/600x600'),

(19, 'https://placehold.co/600x600'),
(19, 'https://placehold.co/600x600'),
(19, 'https://placehold.co/600x600'),

(20, 'https://placehold.co/600x600'),
(20, 'https://placehold.co/600x600'),
(20, 'https://placehold.co/600x600'),

(21, 'https://placehold.co/600x600'),
(21, 'https://placehold.co/600x600'),
(21, 'https://placehold.co/600x600'),

(22, 'https://placehold.co/600x600'),
(22, 'https://placehold.co/600x600'),
(22, 'https://placehold.co/600x600'),

(23, 'https://placehold.co/600x600'),
(23, 'https://placehold.co/600x600'),
(23, 'https://placehold.co/600x600'),

(24, 'https://placehold.co/600x600'),
(24, 'https://placehold.co/600x600'),
(24, 'https://placehold.co/600x600'),

(25, 'https://placehold.co/600x600'),
(25, 'https://placehold.co/600x600'),
(25, 'https://placehold.co/600x600'),

(26, 'https://placehold.co/600x600'),
(26, 'https://placehold.co/600x600'),
(26, 'https://placehold.co/600x600'),

(27, 'https://placehold.co/600x600'),
(27, 'https://placehold.co/600x600'),
(27, 'https://placehold.co/600x600'),

(28, 'https://placehold.co/600x600'),
(28, 'https://placehold.co/600x600'),
(28, 'https://placehold.co/600x600'),

(29, 'https://placehold.co/600x600'),
(29, 'https://placehold.co/600x600'),
(29, 'https://placehold.co/600x600'),

(30, 'https://placehold.co/600x600'),
(30, 'https://placehold.co/600x600'),
(30, 'https://placehold.co/600x600');