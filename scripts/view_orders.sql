create view view_orders
as
    select orders.id, orders.userId, orders.status, orders.placementDate, concat(convert(floor(sum(orderItems.price)/100), char), 'zl ', convert(mod(sum(orderItems.price), 100), char), 'gr') as price
    from
    orders inner join orderItems on orderItems.orderId = orders.id
    group by orders.id;

grant select on store.view_orders to 'client'@'localhost';
grant select on store.view_orders to 'owner'@'localhost';
grant select on store.view_orders to 'admin'@'localhost';
