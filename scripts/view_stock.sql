create view view_stock
as
    select id, name, available, concat(convert(floor(price/100), char), 'zl ', convert(mod(price, 100), char), 'gr') as price, description
    from
    stock;

grant select on store.view_stock to 'client'@'localhost';
grant select on store.view_stock to 'owner'@'localhost';
grant select on store.view_stock to 'admin'@'localhost';
