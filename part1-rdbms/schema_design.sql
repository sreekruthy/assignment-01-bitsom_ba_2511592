/* customers table */
create table customers(
    customer_id varchar(10) primary key, 
    customer_name varchar(100) not null, 
    customer_email varchar(100) not null, 
    customer_city varchar(50) not null 
);

insert into customers values
('C013', 'Arya', 'arya@mail.com', 'Delhi'),
('C010', 'Dilip', 'dilip@mail.com', 'Mumbai'),
('C017', 'Chaitra', 'chaitra@mail.com', 'Chennai'),
('C012', 'Deepthi', 'deepthi@mail.com', 'Hyderabad'),
('C025', 'Arjun', 'arjun@mail.com', 'Bangalore');


/* products table */
create table products (
    product_id varchar(10) primary key,
    product_name varchar(100) not null,
    category varchar(50) not null,
    unit_price decimal(10,2) not null
);

insert into products values
('P009', 'Ipad', 'Electronics', 75000),
('P010', 'Pencils', 'Stationery', 300),
('P012', 'Bluetooth speaker', 'Accessories', 2000),
('P013', 'Desk Chair', 'Furniture', 6000),
('P017', 'Monitor', 'Electronics', 12000);


/* sales reps table */
create table sales_reps (
    sales_rep_id varchar(10) primary key,
    sales_rep_name varchar(100) not null,
    sales_rep_email varchar(100) not null unique,
    office_address text not null,
);

insert into sales_reps values
('SR08', 'Rahul', 'rahul@gmail.com', 'Delhi Office, Connaught Place, New Delhi - 110001'),
('SR09', 'Priya', 'priya@gmail.com', 'South Zone, MG Road, Bangalore - 560001'),
('SR10', 'Amit', 'amit@gmail.com', 'Mumbai HQ, Nariman Point, Mumbai - 400021'),
('SR12', 'Neha', 'neha@gmail.com', 'Chennai Branch, Anna Salai, Chennai - 600002'),
('SR13', 'Kiran', 'kiran@gmail.com', 'Hyderabad Office, Banjara Hills, Hyderabad - 500034');


/* orders table */
create table orders (
    order_id varchar(10) primary key,
    customer_id varchar(10) not null,
    sales_rep_id varchar(10) not null,
    order_date date not null,
    foreign key (customer_id) references customers(customer_id),
    foreign key (sales_rep_id) references sales_reps(sales_rep_id)
);

insert into orders values
('ORD0001', 'C013', 'SR08', '2023-08-01'),
('ORD00002', 'C010', 'SR09', '2023-01-07'),
('ORD0003', 'C025', 'SR13', '2023-02-03'),
('ORD0004', 'C012', 'SR12', '2023-06-12'),
('ORD0005', 'C017', 'SR10', '2023-03-05');


/* order_items table */
create table order_items (
    order_id varchar(10) not null,
    product_id varchar(10) not null,
    quantity int not null,
    primary key (order_id, product_id),
    foreign key (order_id) references orders(order_id),
    foreign key (product_id) references products(product_id)
);

insert into order_items values
('ORD0001', 'P009', 1),
('ORD0002', 'P010', 7),
('ORD0003', 'P012', 3),
('ORD0004', 'P013', 2),
('ORD0005', 'P017', 4);