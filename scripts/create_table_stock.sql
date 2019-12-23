create table if not exists stock(
   id int not null auto_increment,
   name varchar(255) not null,
   price int not null,
   available bit not null,
   primary key(id)
);