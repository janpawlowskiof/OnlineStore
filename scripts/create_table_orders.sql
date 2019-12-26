drop table if exists orders;

create table if not exists orders(
    id int not null auto_increment unique,
    userId int not null,
    status enum('Waiting', 'Shipping', 'Complete', 'Canceled'),
    placementDate date,
    primary key(id),
    foreign key(userId) references users(id)
);

grant insert, select, delete on store.orders TO 'admin'@'localhost';
grant insert, select, delete on store.orders TO 'owner'@'localhost';
grant select on store.orders TO 'client'@'localhost';