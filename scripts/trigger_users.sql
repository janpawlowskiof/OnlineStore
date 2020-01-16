delimiter //
create trigger triggerBeforeDeleteOnUsers before delete on users
        for each row
        begin

            if (select count(*) from orderItems inner join orders on orderItems.orderId = orders.id where orders.userId = OLD.id) > 0
            then
                signal sqlstate '45000'
                set message_text = 'Cannot delete a user \nwho already made \na purchase';
            end if;

            delete from cart where userId = OLD.id;

        end //
delimiter ;