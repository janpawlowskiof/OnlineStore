delimiter //
 
create procedure remove_from_cart(email varchar(255), password varchar(255), item_id int)
begin
    declare user_id int;

    set user_id = verify_user(email, password);

    if user_id not in (select id from users)
    then
        signal sqlstate '45000'
        set message_text = 'No such user';
    end if;

    delete from cart where userId = user_id and itemId = item_id;
end //
 
delimiter ;

grant execute on procedure store.remove_from_cart to 'client'@'localhost';
