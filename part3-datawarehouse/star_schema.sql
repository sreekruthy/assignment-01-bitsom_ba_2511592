/*dimension tables*/
create table dim_date (
    date_id int primary key,
    full_date date not null,
    year int not null,
    month int not null,
    quarter int not null
);

create table dim_store (
    store_id int primary key,
    store_name varchar(100) not null,
    store_city varchar(100) not null
);

create table dim_product (
    product_id int primary key,
    product_name varchar(100) not null,
    category varchar(50) not null,
    unit_price decimal(10,2) not null
);

/*fact table*/
create table fact_sales (
    transaction_id varchar(20) primary key,
    date_id int not null,
    product_id int not null,
    store_id int not null,
    units_sold int not null,
    unit_price decimal(10,2) not null,
    total_amount decimal(10,2) not null,

    foreign key (date_id) references dim_date(date_id),
    foreign key (store_id) references dim_store(store_id),
    foreign key (product_id) references dim_product(product_id)
);

/*dates*/
insert into dim_date values
(20230829, '2023-08-29', 2023, 8, 3),
(20231212, '2023-12-12', 2023, 12, 4),
(20230205, '2023-02-05', 2023, 2, 1),
(20230220, '2023-02-20', 2023, 2, 1),
(20230115, '2023-01-15', 2023, 1, 1),
(20230809, '2023-08-09', 2023, 8, 3),
(20230331, '2023-03-31', 2023, 3, 1),
(20231026, '2023-10-26', 2023, 10, 4),
(20231208, '2023-12-08', 2023, 12, 4),
(20230815, '2023-08-15', 2023, 8, 3);

/*stores*/
insert into dim_store values
(1, 'Delhi South', 'Delhi'),
(2, 'Mumbai Central', 'Mumbai'),
(3, 'Bangalore MG', 'Bangalore'),
(4, 'Chennai Anna', 'Chennai'),
(5, 'Pune FC Road', 'Pune');

/*products*/
insert into dim_product values
(1, 'Tablet', 'Electronics',23226.12),
(2, 'Headphones', 'Electronics', 39854.96),
(3, 'Jeans', 'Clothing', 2317.47),
(4, 'Saree', 'Clothing', 35451.81),
(5, 'Pulses 1kg', 'Grocery', 31604.47);

/*sales*/
insert into fact_sales (transaction_id, date_id, product_id, store_id, units_sold, unit_price, total_amount) values
('TXN5000', 20230829, 1, 1, 3, 23226.12, 69678.36),
('TXN5001', 20231212, 2, 5, 11, 39854.96, 438404.56),
('TXN5002', 20230205, 3, 1, 20, 2317.47, 46349.40),
('TXN5003', 20230220, 2, 2, 14, 39854.96, 557969.44),
('TXN5004', 20230115, 4, 1, 10, 35451.81, 354518.10),
('TXN5005', 20230809, 5, 3, 12, 31604.47, 379253.64),
('TXN5006', 20230331, 4, 5, 6, 35451.81, 212710.86),
('TXN5007', 20231026, 4, 4, 16, 35451.81, 567228.96),
('TXN5008', 20231208, 2, 3, 9, 39854.96, 358694.64),
('TXN5009', 20230815, 5, 3, 3, 31604.47, 94813.41);