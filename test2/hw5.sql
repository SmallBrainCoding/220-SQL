create table customers
(
    id        int auto_increment
        primary key,
    firstname varchar(20) null,
    lastname  varchar(20) null,
    constraint id
        unique (id)
);

create table orders
(
    id         int auto_increment
        primary key,
    product    varchar(20) null,
    cost       int         null,
    customerId int         null,
    constraint id
        unique (id)
);

create table products
(
    id           int auto_increment
        primary key,
    orders_id    int not null,
    customers_id int not null,
    constraint id
        unique (id)
);


