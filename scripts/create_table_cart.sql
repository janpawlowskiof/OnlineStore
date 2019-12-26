drop table if exists cart;

create table if not exists cart(
   userId int not null,
   itemId int not null,
   amount int not null check(amount > 0),
   price int not null check(price > 0),
   primary key(userId, itemId),
   foreign key(userId) references users(id),
   foreign key(itemId) references stock(id)
);