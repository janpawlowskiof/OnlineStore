create table if not exists users(
   id int not null auto_increment,
   email varchar(255) not null check(email like '%_@_%') unique,
   password varchar(255) not null,
   firstName varchar(63) not null,
   lastName varchar(63) not null,
   addressLine1 varchar(255) not null,
   addressLine2 varchar(255),
   primary key(id)
);

grant insert, select, delete on store.users TO 'admin'@'localhost';
grant insert, select, delete on store.users TO 'owner'@'localhost';
grant insert on store.users TO 'client'@'localhost';