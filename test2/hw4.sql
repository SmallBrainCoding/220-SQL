create table customers
(
    id        int auto_increment
        primary key,
    firstname varchar(20) null,
    lastname  varchar(20) null,
    company   varchar(20) null,
    constraint id
        unique (id)
);

create table orders
(
    id1        int auto_increment
        primary key,
    product    varchar(20) null,
    cost       int         null,
    customerId int         null,
    constraint id1
        unique (id1),
    constraint orders_ibfk_1
        foreign key (customerId) references customers (id)
);

alter table customers
    add constraint fk_orders
        foreign key (id) references orders (customerId);

create index customerId
    on orders (customerId);


