create view view_order_items
as
    select stock.name as name, orders.id as orderId, orders.userId, orderItems.amount as amount, orderItems.price as pricePerUnit
    from
    orders inner join orderItems on orderItems.orderId = orders.id inner join stock on orderItems.itemId = stock.id;