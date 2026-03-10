select * from products;
select * from product_size;
select * from product_variant;

-- 1. dapatkan 1 product yang sudah diagregasikan dengan variant dan size yang dipilih.
-- nama product, final price, variant, size
select
p.id as product_id,
p.name as product_name,
pv.name as variant,
ps.name as size,
p.price as origin_price,
pv.add_price as price_variant,
ps.add_price as price_size,
(p.price + pv.add_price + ps.add_price) as total_price

from products p
join product_variant pv on p.id = pv.product_id
join product_size ps on p.id = ps.product_id
where p.id = 1 and pv.name ilike 'extra shot' and ps.name ilike 'large';

-- atau bisa pakai subquery (belum bisa di total price):

-- 2. buat query untuk mendapatkan data yang sebelumnya (final price -> price item) + quantity + subtotal.
-- caranya pakai subquery

-- query: union all. kolom yang diambil harus sama, yang dibedakan hanya parameter di wherenya saja
-- hasil akhir:
-- select name, quantity from(x) as <nama tabel baru bebas>
-- tidak pakai tabel lain, tujuannya adalah bahwa dengan query saja sudah bisa mengolah data.

-- 3. analisa landing page, kebutuhan querynya apa.
-- 4. analisa browse product, query pencarian apa saja di product yang sama?

-- buatkan lagi query, disesuaikan dengan kebutuhan halaman.
-- query update untuk halaman profile.