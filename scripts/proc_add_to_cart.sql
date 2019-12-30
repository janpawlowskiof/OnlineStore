delimiter //
 
create procedure add_to_cart(email varchar(255), password varchar(255), item_id int, amount int)
begin
    declare user_id int;

    set user_id = verify_user(email, password);

    if user_id not in (select id from users)
    then
        signal sqlstate '45000'
        set message_text = 'No such user';
    end if;

    if item_id not in (select id from stock)
    then
        signal sqlstate '45000'
        set message_text = 'No such item in stock';
    end if;

    if (select available from stock where id = item_id) = 0
    then
        signal sqlstate '45000'
        set message_text = 'Item is unavailable';
    end if;

    set @price = (select price from stock where id = item_id);
    delete from cart where userId = user_id and itemId = item_id;
    insert into cart(userId, itemId, amount, price) values (user_id, item_id, amount, @price);
    
end //
 
delimiter ;

grant execute on procedure store.add_to_cart to 'client'@'localhost';
