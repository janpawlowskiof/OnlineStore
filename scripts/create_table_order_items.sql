drop table if exists orderItems;

create table if not exists orderItems(
   orderId int not null,
   itemId int not null,
   amount int not null check(amount > 0),
   price int not null check(price > 0),
   primary key(orderId, itemId),
   foreign key(orderId) references orders(id),
   foreign key(itemId) references stock(id)
);