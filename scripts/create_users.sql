drop user if exists 'admin'@'localhost';
drop user if exists 'owner'@'localhost';
drop user if exists 'client'@'localhost';

create user 'admin'@'localhost' identified by 'admin';
create user 'owner'@'localhost' identified by '1234';
create user 'client'@'localhost';