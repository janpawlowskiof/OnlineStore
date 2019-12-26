insert into users(email, password, firstName, lastName, addressLine1, addressLine2)
values
('jan@jan.com', '1234', 'juan', 'pablo', 'adminland', 'adminland2'),
('paulina@paulina.com', '1234', 'paulina', 'adminka', 'adminland', 'adminland2');

insert into stock(name, price, available, description)
values
('coca-cola 1l', 400, 14, 'a delicious cola'),
('coca-cola 2l', 550, 25, null),
('hammer', 1000, 10, 'a very hard hammer')