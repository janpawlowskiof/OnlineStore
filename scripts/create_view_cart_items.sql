drop table if exists cart;

create view cart_items
as

select );

grant insert, select, delete on store.cart TO 'admin'@'localhost';
grant insert, select, delete on store.cart TO 'owner'@'localhost';
grant select, delete on store.cart TO 'client'@'localhost';
