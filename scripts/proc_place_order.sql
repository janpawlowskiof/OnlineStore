delimiter //
 
create procedure place_order(user_id int)
begin
    declare order_id int;
    start transaction;

    if user_id not in (select id from users)
    then
        signal sqlstate '45000'
        set message_text = 'No such user';
    end if;

    if (select count(*) from cart where userId = user_id) = 0
    then
        signal sqlstate '45000'
        set message_text = 'No items in cart';
    end if;

    set order_id = (select max(id) from orders) + 1;
    if order_id is null
    then
    set order_id = 1;
    end if;
    
    insert into orders(id, userId, status, placementDate)
    values
    (order_id, user_id, 'Waiting', curdate());

    insert into orderItems(orderId, itemId, amount, price)
    (select order_id, itemId, amount, price from cart
    where userId = user_id);

    delete from cart where userId = user_id;
    
    commit;
end //
 
delimiter ;