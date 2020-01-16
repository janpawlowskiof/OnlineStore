create view view_order_items
as
    select stock.name as name, orders.id as orderId, orders.userId, orderItems.amount as amount, concat(convert(floor(orderItems.price/100), char), 'zl ', convert(mod(orderItems.price, 100), char), 'gr') as price
    from
    orders inner join orderItems on orderItems.orderId = orders.id inner join stock on orderItems.itemId = stock.id;

grant select on store.view_order_items to 'client'@'localhost';
grant select on store.view_order_items to 'owner'@'localhost';
grant select on store.view_order_items to 'admin'@'localhost';
