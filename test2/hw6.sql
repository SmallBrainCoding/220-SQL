create table customers
(
    id         int auto_increment
        primary key,
    firstname  varchar(20) null,
    lastname   varchar(20) null,
    customerID int         not null,
    constraint id
        unique (id)
);

create table orders
(
    id         int auto_increment
        primary key,
    product    varchar(20) null,
    cost       int         null,
    orderID    int         not null,
    customerID int         not null,
    constraint id
        unique (id),
    constraint orders_ibfk_1
        foreign key (customerID) references customers (id)
);

create index customerID
    on orders (customerID);

create table products
(
    id         int auto_increment
        primary key,
    brand      varchar(20) null,
    productID  int         not null,
    customerID int         not null,
    orderID    int         not null,
    constraint id
        unique (id),
    constraint products_ibfk_1
        foreign key (customerID) references customers (id),
    constraint products_ibfk_2
        foreign key (orderID) references orders (id)
);

create index customerID
    on products (customerID);

create index orderID
    on products (orderID);


