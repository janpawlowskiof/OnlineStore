drop table if exists orders;

create table if not exists orders(
    id int not null auto_increment,
    userId int not null,
    status enum('Planning', 'Shipping', 'Complete'),
    placementDate date,
    primary key(id),
    foreign key(userId) references users(id)
);