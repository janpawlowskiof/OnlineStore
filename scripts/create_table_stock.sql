create table if not exists stock(
   id int not null auto_increment,
   name varchar(255) not null unique,
   price int not null,
   available int not null check(available >= 0),
   description varchar(255),
   primary key(id)
);

grant select on store.stock TO 'admin'@'localhost';
grant insert, update, select, delete on store.stock TO 'owner'@'localhost';
/* grant select on store.stock TO 'client'@'localhost'; */
