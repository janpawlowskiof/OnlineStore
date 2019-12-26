drop table if exists orders;

create table if not exists orders(
    id int not null auto_increment unique,
    userId int not null,
    status enum('Waiting', 'Shipping', 'Complete'),
    placementDate date,
    primary key(id),
    foreign key(userId) references users(id)
);