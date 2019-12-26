delimiter //
create trigger triggerBeforeInsertOrderItem before insert on orderItems
       for each row
       begin
           if (select available from stock where id = NEW.itemId) < NEW.amount THEN
                signal sqlstate '45000'
                set message_text = 'There are not enough items';
           else
               update stock set available = available - NEW.amount where id = NEW.itemId;
           end if;
       end //
delimiter ;

delimiter //
create trigger triggerBeforeUpdateOrderItem before update on orderItems
        for each row
        begin
            set @status = (select status from orders where id = NEW.orderID);
            if status = 'Completed'
            then
                signal sqlstate '45000'
                set message_text = 'Cannot modify completed order';
            end if;

            update stock set available = available + OLD.amount - NEW.amount where id = NEW.itemId;
        end //
delimiter ;