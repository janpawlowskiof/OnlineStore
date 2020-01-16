delimiter //
create trigger triggerBeforeDeleteOnStock before delete on stock
        for each row
        begin
            if (select count(*) from cart where cart.itemId = OLD.id) > 0 or (select count(*) from orderItems where orderItems.itemId = OLD.id) > 0
            then
                signal sqlstate '45000'
                set message_text = 'Cannot delete item \nthat is in user\'s cart or \nhas beed ordered';
            end if;

        end //
delimiter ;