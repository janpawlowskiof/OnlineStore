delimiter //

create function verify_user (email varchar(255), password varchar(255))
returns int
deterministic

begin

declare user_id int default null;
set user_id = (select id from users where users.email = email and users.password = password);

if user_id is null
then
    do sleep(2);
    return -1;
end if;

return user_id;

end //

delimiter ;

grant execute on function store.verify_user to 'client'@'localhost';
