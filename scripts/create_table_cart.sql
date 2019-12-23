drop table if exists cart;

create table if not exists cart(
   userId int not null,
   itemId int not null,
   amount int not null check(amount > 0),
   totalPrice int not null check(totalPrice > 0),
   primary key(userId, itemId),
   foreign key(userId) references users(id),
   foreign key(itemId) references stock(id)
);