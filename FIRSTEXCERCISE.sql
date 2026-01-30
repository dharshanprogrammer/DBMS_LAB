DROP DATABASE IF EXISTS demo_relations;
create database demo_relations character set utf8mb4 collate utf8mb4_unicode_ci;
use demo_relations;
create table instiution(
instution_id int auto_increment,
name varchar(200) not null,
city varchar(200) not null,
primary key(instution_id)
)engine = InnoDB;

show engines;
alter table instiution rename to institution;
alter table institution change instution_id institution_id int;
show table status like 'institution';

create table department(
department_id int auto_increment,
institution_id int not null,
department_name varchar(200) not null,
head_faculty_id varchar(200) default null,
primary key(department_id),
foreign key(institution_id) references institution(institution_id)
on update cascade
on delete cascade
)engine = InnoDb;

create table faculty(
faculty_id int primary key auto_increment,
name varchar(100) not null,
department_id int ,
foreign key (department_id) references department(department_id)

);
select * from faculty;
insert into institution values (1,"Cit","Coimbatore"),(2,"SKET","Coimbatore"),(3,"PSG","Coimbatore"),
(4,"ELITE UNIVERSITY","Delhi"),(5,"Prime","Coimbatore"),(6,"Rich","Coimbatore"),(7,"SNS","Coimbatore"),
(8,"kpr","Coimbatore"),(9,"xyz college","chennai"),(10,"srm","chennai");
select *from institution;
 alter table department
 drop column head_faculty_id;
 select * from department;

insert into department (department_id,institution_id,department_name) values (1,1,'CSE'),
(2,1,'ECE'),
(3,2,'EEE'),
(4,2,'MECH'),
(5,3,'CIVIL'),
(6,4,'IT'),
(7,5,'AI'),
(8,6,'DS'),
(9,7,'MBA'),
(10,8,'BIO');

select * from department;

insert into faculty (faculty_id,name,department_id) values (1,'Dr. Arun',1),
(2,'Dr. Bala',2),
(3,'Dr. Charan',3),
(4,'Dr. Deepak',4),
(5,'Dr. Ezhil',5),
(6,'Dr. Farooq',6),
(7,"Dr. vignesh",7),
(8,"Dr. Dharshan",8),
(9,"Dr. Senthil",9),
(10,"Dr. Santhi",10);
CREATE TABLE course (
    course_id INT AUTO_INCREMENT PRIMARY KEY,
    department_id INT NOT NULL,
    course_name VARCHAR(200) NOT NULL,
    FOREIGN KEY (department_id)
        REFERENCES department(department_id)
        ON UPDATE CASCADE
        ON DELETE CASCADE
) ENGINE = InnoDB;
CREATE TABLE student (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    student_name VARCHAR(200) NOT NULL,
    course_id INT NOT NULL,
    year_of_study INT NOT NULL,
    FOREIGN KEY (course_id)
        REFERENCES course(course_id)
        ON UPDATE CASCADE
        ON DELETE CASCADE
) ENGINE = InnoDB;
INSERT INTO course (course_id, department_id, course_name) VALUES
(1,1,'Computer Science Engineering'),
(2,2,'Electronics and Communication'),
(3,3,'Electrical and Electronics'),
(4,4,'Mechanical Engineering'),
(5,5,'Civil Engineering'),
(6,6,'Information Technology'),
(7,7,'Artificial Intelligence'),
(8,8,'Data Science'),
(9,9,'Master of Business Administration'),
(10,10,'Biotechnology');
INSERT INTO student (student_id, student_name, course_id, year_of_study) VALUES
(1,'Ajay',1,2),
(2,'Balaji',2,3),
(3,'Charan',3,1),
(4,'Deepika',4,4),
(5,'Eswar',5,2),
(6,'Farah',6,3),
(7,'Gokul',7,1),
(8,'Hari',8,2),
(9,'Indhu',9,4),
(10,'Jeevan',10,1);

drop database if exists demo_bank;
create database demo_bank;
use demo_bank;
create table bank(
bank_id int auto_increment primary key,
bank_name varchar(200) not null,
city varchar(200) not null
)engine	= InnoDB;
create table branch(
branch_id int auto_increment primary key,
bank_id int not null,
branch_name varchar(200) not null,
foreign key (bank_id) references bank(bank_id)
on delete cascade
on update cascade
);
create table customer(
customer_id int auto_increment primary key,
customer_name varchar(200) not null,
city varchar(150) not null);

create table account(
account_id int auto_increment primary key,
customer_id int not null,
balance_id decimal(10,2),
foreign key (customer_id) references customer(customer_id)
on update cascade
on delete cascade);


insert into bank (bank_id,bank_name,city) values (1,'SBI','Chennai'),
(2,'HDFC','Mumbai'),
(3,'ICICI','Delhi'),
(4,'AXIS','Bangalore'),
(5,'PNB','Chennai'),
(6,'KVB','Madurai'),
(7,'IOB','Trichy'),
(8,'Canara','Coimbatore'),
(9,'Union','Salem'),
(10,'Indian Bank','Erode');

insert into branch (branch_id,bank_id,branch_name ) values (1,1,"Delhi Central"),
(2,2,'HDFC Central'),
(3,3,'ICICI City'),
(4,4,'AXIS North'),
(5,5,'PNB South'),
(6,6,'KVB Town'),
(7,7,'IOB East'),
(8,8,'Canara West'),
(9,9,'Union Main'),
(10,10,'Indian Prime');

insert into customer(customer_id,customer_name,city) values(1,'Arun','Chennai'),
(2,'Bala','Coimbatore'),
(3,'Charan','Madurai'),
(4,'Deepak','Salem'),
(5,'Ezhil','Trichy'),
(6,'Farooq','Erode'),
(7,'Ganesh','Chennai'),
(8,'Hari','Bangalore'),
(9,'Imran','Mumbai'),
(10,'Jeeva','Delhi');
UPDATE customer SET dob='2002-01-15' WHERE customer_id=1;
UPDATE customer SET dob='2001-05-10' WHERE customer_id=2;
UPDATE customer SET dob='2000-08-21' WHERE customer_id=3;
UPDATE customer SET dob='2003-02-12' WHERE customer_id=4;
UPDATE customer SET dob='2002-07-30' WHERE customer_id=5;
UPDATE customer SET dob='1999-11-05' WHERE customer_id=6;
UPDATE customer SET dob='2001-04-18' WHERE customer_id=7;
UPDATE customer SET dob='2000-09-09' WHERE customer_id=8;
UPDATE customer SET dob='2002-12-25' WHERE customer_id=9;
UPDATE customer SET dob='2003-06-14' WHERE customer_id=10;

alter table account change balance_id  balance decimal(10,2);
insert into account (account_id,customer_id,balance) values (1,1,10000),
(2,2,20000),
(3,3,15000),
(4,4,18000),
(5,5,22000),
(6,6,30000),
(7,7,12000),
(8,8,25000),
(9,9,27000),
(10,10,35000);
CREATE TABLE debit_card (
    card_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    account_id INT NOT NULL,

    card_number VARCHAR(20) UNIQUE NOT NULL,
    card_pin INT NOT NULL,

    issue_date DATE NOT NULL,
    expiry_date DATE NOT NULL,

    status VARCHAR(20) DEFAULT 'active',

    FOREIGN KEY (customer_id)
        REFERENCES customer(customer_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,

    FOREIGN KEY (account_id)
        REFERENCES account(account_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
) ENGINE = InnoDB;
INSERT INTO debit_card 
(customer_id, account_id, card_number, card_pin, issue_date, expiry_date, status)
VALUES

(1, 1, '5000111122220001', 1234, '2021-01-10', '2026-01-10', 'active'),
(2, 2, '5000111122220002', 2345, '2020-05-15', '2025-05-15', 'active'),
(3, 3, '5000111122220003', 3456, '2019-03-20', '2024-03-20', 'active'),
(4, 4, '5000111122220004', 4567, '2022-06-01', '2027-06-01', 'active'),
(5, 5, '5000111122220005', 5678, '2018-02-11', '2023-02-11', 'active'),

(6, 6, '5000111122220006', 6789, '2017-10-05', '2022-10-05', 'active'),
(7, 7, '5000111122220007', 7890, '2023-08-19', '2028-08-19', 'active'),
(8, 8, '5000111122220008', 8901, '2016-12-25', '2021-12-25', 'active'),

(9, 9, '5000111122220009', 9012, '2020-09-09', '2025-09-09', 'active'),
(10,10,'5000111122220010', 1122, '2021-11-14', '2026-11-14', 'active');

select * from account  where account_id = 1;
drop database if exists ATM_DB;
create database ATM_DB;
USE ATM_DB;

create table bank(
bank_id int auto_increment primary key,
bank_name varchar(200) not null)engine = InnoDB;
INSERT INTO bank (bank_name) VALUES
('State Bank of India'),
('Indian Overseas Bank'),
('Canara Bank'),
('HDFC Bank'),
('ICICI Bank'),
('Axis Bank'),
('Punjab National Bank'),
('Union Bank'),
('Bank of Baroda'),
('Central Bank of India');

create table machine(
machine_id int auto_increment primary key,
location varchar(200) not null,
bank_id int not null,
foreign key (bank_id) references bank(bank_id)
on update cascade
on delete cascade 
);
CREATE TABLE bank_transaction (
    txn_id INT AUTO_INCREMENT PRIMARY KEY,
    account_id INT NOT NULL,
    txn_type VARCHAR(50) NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    txn_date DATE NOT NULL,

    FOREIGN KEY (account_id)
        REFERENCES account(account_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
) ENGINE = InnoDB;
INSERT INTO bank_transaction (account_id, txn_type, amount, txn_date) VALUES

(1, 'Deposit', 5000, '2025-12-10'),
(2, 'Withdraw', 2000, '2025-11-05'),
(3, 'Deposit', 3000, '2025-10-20'),
(4, 'Withdraw', 1500, '2025-09-15'),

(5, 'Deposit', 4000, '2022-01-10'),
(6, 'Withdraw', 2500, '2021-06-18'),

(7, 'Deposit', 6000, '2020-03-25'),
(8, 'Withdraw', 1000, '2019-08-12'),

(9, 'Deposit', 3500, '2023-01-15'),

(10, 'Withdraw', 500, '2026-01-01');

INSERT INTO machine (location, bank_id) VALUES
('Coimbatore', 1),
('Chennai', 2),
('Madurai', 3),
('Salem', 4),
('Trichy', 5),
('Erode', 6),
('Vellore', 7),
('Tirunelveli', 8),
('Thanjavur', 9),
('Bangalore', 10);

create table account(
account_id int auto_increment primary key,
customer_name varchar(200) not null,
balance decimal(10,2) not null
);
ALTER TABLE account
add customer_name varchar(200) not null;

select * from account;
insert into account (account_id,balance,customer_name) values(1,10000000.00,"DharshanSenthil");
select * from account;
insert into account(account_id,customer_name,balance) values (2,'Arun Kumar', 50000.00),
(3,'Bala Murugan', 75000.00),
(4,'Charan Raj', 62000.00),
(5,'Deepak', 88000.00),
(6,'Ezhil', 43000.00),
(7,'Farooq', 91000.00),
(8,'Ganesh', 56000.00),
(9,'Hari', 67000.00),
(10,'Imran', 82000.00);
select *from account;
create table card (
 card_id int auto_increment primary key,
 account_id int not null,
 card_number varchar(200) not null unique,
 card_type varchar(100) not null,
 foreign key(account_id)
 references account(account_id)
 on delete cascade
 on update cascade
 );
select * from card;
insert into card(account_id,card_number,card_type) value (1,'4111111111110001','Credit');
insert into card(account_id,card_number,card_type) values (2,'4111111111110002','Debit'),
(3,'4111111111110003','Debit'),
(4,'4111111111110004','Debit'),
(5,'4111111111110005','Debit'),
(6,'4111111111110006','Debit'),
(7,'4111111111110007','Debit'),
(8,'4111111111110008','Debit'),
(9,'4111111111110009','Debit'),
(10,'4111111111110010','Debit');



create table transaction(
txn_id INT primary key,
machine_id int ,
card_number int,
account_id int ,
txn_type varchar(200),
amount int,
denom_2000 int default 0,
denom_500 int default 0,
denom_200 int default 0,
txn_date date,
start_time time,
end_time time,
foreign key(machine_id)
references machine(machine_id),

foreign key(card_number)
references card(card_id),

foreign key(account_id)
references account(account_id)
);
INSERT INTO transaction
(machine_id, card_id, account_id, txn_type, amount,
 denom_2000, denom_500, denom_200, txn_date, start_time, end_time)
VALUES
(1,1,1,'Withdraw',5000,2,2,0,'2026-01-20','10:00:00','10:02:00'),
(1,2,2,'Withdraw',2000,1,0,0,'2026-01-20','11:00:00','11:01:00'),
(2,3,3,'Withdraw',1500,0,3,0,'2026-01-21','09:30:00','09:33:00'),
(2,4,4,'Withdraw',4000,2,0,0,'2026-01-21','12:00:00','12:04:00'),
(3,5,5,'Withdraw',1000,0,2,0,'2026-01-22','10:10:00','10:12:00'),
(3,6,6,'Withdraw',7000,3,2,0,'2026-01-22','14:00:00','14:05:00'),
(4,7,7,'Withdraw',600,0,1,0,'2026-01-23','15:20:00','15:22:00'),
(4,8,8,'Withdraw',2500,1,1,0,'2026-01-23','16:00:00','16:03:00'),
(5,9,9,'Withdraw',9000,4,2,0,'2026-01-24','17:00:00','17:06:00'),
(5,10,10,'Withdraw',3000,1,2,0,'2026-01-24','18:00:00','18:04:00');

create table refill(
refill_id int primary key,
machine_id int,
denom_2000 int default 0,
demom_500 int default 0,
denom_200 int default 0,

foreign key(machine_id)
references machine(machine_id)
);

drop database if exists electricity_board;
create database electricity_board;
use electricity_board;
create table consumer(
consumer_id int auto_increment primary key,
consumer_name varchar(100) not null,
address varchar(200) not null,
phone varchar(50) not null
);
select * from consumer;

insert into consumer(consumer_name,address,phone) value('DharshanSenthil','Erode','123456');

insert into consumer(consumer_name,address,phone) values('Bala','Coimbatore','900002'),
('Charan','Madurai','900003'),
('Deepak','Salem','900004'),
('Ezhil','Trichy','900005'),
('Farooq','Erode','900006'),
('Ganesh','Vellore','900007'),
('Hari','Tirunelveli','900008'),
('Imran','Thanjavur','900009'),
('Jeeva','Chennai','900010');

create table connection(
connection_id int auto_increment primary key,
consumer_id int not null,
connection_type varchar(100) not null,
foreign key (consumer_id)
references consumer(consumer_id)
on update cascade
on delete cascade
);
insert into connection (consumer_id,connection_type) value (1,'Commercial');
select * from connection;
insert into connection (consumer_id,connection_type) value (2,'Commercial'),(3,'Domestic'),(4,'Domestic'),
(5,'Commercial'),(6,'Domestic'),(7,'Domestic'),(8,'Commercial'),
(9,'Domestic'),(10,'Domestic');

create table tarif(
tarif_id int auto_increment primary key,
tarif_name varchar(100) not null,
rate_per_unit decimal(6,2) not null check(rate_per_unit>0)
);
insert into tarif (tarif_name,rate_per_unit) value ('Domestic',3.5);
insert into tarif (tarif_name,rate_per_unit) values ('Commercial',7.00),
('Industrial',10.00),
('Agriculture',1.50),
('Public',5.00),
('Hostel',4.00),
('Hospital',6.50),
('School',3.00),
('Office',6.00),
('Shop',7.50);
select *from tarif;
create table bill(
bill_id int auto_increment primary key,
connection_id int not null,
tarif_id int not null,
units_consumed int not null,
bill_amount decimal(10,2) not null,
bill_date date not null,
foreign key(connection_id) 
references connection(connection_id)
on update cascade
on delete cascade,
foreign key(tarif_id)
references tarif(tarif_id)
on update cascade
on delete cascade
);

select *from bill;
insert into bill(connection_id,tarif_id,units_consumed,bill_amount,bill_date) value(1,1,250,1750,'2024-05-24');

insert into bill(connection_id,tarif_id,units_consumed,bill_amount,bill_date) values(2,2,300,2100,'2024-01-02'),
(3,1,150,525,'2024-01-03'),
(4,1,180,630,'2024-01-04'),
(5,2,250,1750,'2024-01-05'),
(6,1,120,420,'2024-01-06'),
(7,1,140,490,'2024-01-07'),
(8,2,220,1540,'2024-01-08'),
(9,1,160,560,'2024-01-09'),
(10,1,190,665,'2024-01-10');
create table payment(
payment_id int auto_increment primary key,
bill_id int not null,
payment_date date not  null,
amount_paid decimal(10,2) not null,
payment_mode varchar(50) default 'Cash',
foreign key(bill_id)
references bill(bill_id) 
on update cascade
on delete cascade
)engine = InnoDB;
insert into payment (bill_id,payment_date,amount_paid,payment_mode) value(1,'2025-05-24',1000,'Cash');
select * from payment;
insert into payment (bill_id,payment_date,amount_paid,payment_mode) values (2,'2024-01-06',2100,'Online'),
(3,'2024-01-07',525,'Cash'),
(4,'2024-01-08',630,'Online'),
(5,'2024-01-09',1750,'Cash'),
(6,'2024-01-10',420,'Online'),
(7,'2024-01-11',490,'Cash'),
(8,'2024-01-12',1540,'Online'),
(9,'2024-01-13',560,'Cash'),
(10,'2024-01-14',665,'Online');
delete from consumer where consumer_id=1;
rollback;

show databases;

DROP DATABASE IF EXISTS departmental_store;
CREATE DATABASE departmental_store;
USE departmental_store;
CREATE TABLE store (
    store_id INT AUTO_INCREMENT PRIMARY KEY,
    store_name VARCHAR(100) NOT NULL,
    city VARCHAR(100) NOT NULL
) ENGINE=InnoDB;
CREATE TABLE product (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    price DECIMAL(10,2) NOT NULL
) ENGINE=InnoDB;

CREATE TABLE inventory (
    inventory_id INT AUTO_INCREMENT PRIMARY KEY,
    store_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL CHECK (quantity >= 0),
    FOREIGN KEY (store_id)
        REFERENCES store(store_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (product_id)
        REFERENCES product(product_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
) ENGINE=InnoDB;
CREATE TABLE customer (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    phone VARCHAR(15) UNIQUE
) ENGINE=InnoDB;
CREATE TABLE employee (
    employee_id INT AUTO_INCREMENT PRIMARY KEY,
    employee_name VARCHAR(100) NOT NULL,
    store_id INT NOT NULL,
    FOREIGN KEY (store_id)
        REFERENCES store(store_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
) ENGINE=InnoDB;
CREATE TABLE sales (
    sales_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    product_id INT NOT NULL,
    employee_id INT NOT NULL,
    quantity INT NOT NULL CHECK (quantity > 0),
    sale_date DATE NOT NULL,
    FOREIGN KEY (customer_id)
        REFERENCES customer(customer_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (product_id)
        REFERENCES product(product_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (employee_id)
        REFERENCES employee(employee_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
) ENGINE=InnoDB;

INSERT INTO store (store_name, city) VALUES
('Reliance','Chennai'),
('DMart','Coimbatore'),
('More','Madurai'),
('Nilgiris','Salem'),
('Spencer','Trichy'),
('Big Bazaar','Erode'),
('Smart','Vellore'),
('Fresh Mart','Tirunelveli'),
('Daily Needs','Thanjavur'),
('Super Store','Chennai');
INSERT INTO product (product_name, price) VALUES
('Rice',60),
('Sugar',45),
('Oil',150),
('Milk',30),
('Bread',40),
('Soap',35),
('Shampoo',120),
('Biscuits',25),
('Salt',20),
('Tea Powder',250);
INSERT INTO inventory (store_id, product_id, quantity) VALUES
(1,1,100),(2,2,200),(3,3,150),(4,4,180),(5,5,120),
(6,6,160),(7,7,90),(8,8,210),(9,9,300),(10,10,80);
INSERT INTO customer (customer_name, phone) VALUES
('Arun','900001'),
('Bala','900002'),
('Charan','900003'),
('Deepak','900004'),
('Ezhil','900005'),
('Farooq','900006'),
('Ganesh','900007'),
('Hari','900008'),
('Imran','900009'),
('Jeeva','900010');
INSERT INTO employee (employee_name, store_id) VALUES
('Ravi',1),('Kumar',2),('Suresh',3),('Mani',4),('Arun',5),
('Deepak',6),('Anitha',7),('Priya',8),('Lakshmi',9),('John',10);
INSERT INTO sales (customer_id, product_id, employee_id, quantity, sale_date) VALUES
(1,1,1,2,'2024-01-01'),
(2,2,2,1,'2024-01-02'),
(3,3,3,3,'2024-01-03'),
(4,4,4,2,'2024-01-04'),
(5,5,5,1,'2024-01-05'),
(6,6,6,4,'2024-01-06'),
(7,7,7,1,'2024-01-07'),
(8,8,8,2,'2024-01-08'),
(9,9,9,3,'2024-01-09'),
(10,10,10,1,'2024-01-10');



CREATE TABLE enrollment (
    enrollment_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT NOT NULL,
    course_id INT NOT NULL,
    enrollment_date DATE,

    FOREIGN KEY(student_id) REFERENCES student(student_id),
    FOREIGN KEY(course_id) REFERENCES course(course_id)
);

INSERT INTO enrollment(student_id, course_id)
VALUES
(1,1),
(2,2),
(3,3),
(4,4),
(5,5);
select * from enrollment;
ALTER TABLE student ADD dob DATE;
UPDATE student SET dob='2004-05-12' WHERE student_id=1; 
UPDATE student SET dob='2003-03-10' WHERE student_id=2;
UPDATE student SET dob='2005-08-21' WHERE student_id=3;
UPDATE student SET dob='2002-12-01' WHERE student_id=4;
UPDATE student SET dob='2004-06-15' WHERE student_id=5;
UPDATE student SET dob='2003-09-09' WHERE student_id=6;
UPDATE student SET dob='2005-11-20' WHERE student_id=7;
UPDATE student SET dob='2004-07-25' WHERE student_id=8;
UPDATE student SET dob='2002-04-05' WHERE student_id=9;
UPDATE student SET dob='2005-01-30' WHERE student_id=10;

SELECT student_id,
       student_name,
       dob,
       TIMESTAMPDIFF(YEAR, dob, CURDATE()) AS age
FROM student;

select * from student;

SELECT student_id,
       student_name,
       dob,
       TIMESTAMPDIFF(YEAR, dob, CURDATE()) AS age
FROM student;

ALTER TABLE student ADD status VARCHAR(20) DEFAULT 'active';
UPDATE student
SET status='inactive'
WHERE student_id NOT IN (SELECT student_id FROM enrollment);
show tables;

ALTER TABLE faculty ADD dob DATE;


UPDATE faculty SET dob='1975-06-12' WHERE faculty_id=1;
UPDATE faculty SET dob='1980-04-15' WHERE faculty_id=2;
UPDATE faculty SET dob='1978-09-21' WHERE faculty_id=3;
UPDATE faculty SET dob='1982-11-10' WHERE faculty_id=4;
UPDATE faculty SET dob='1976-03-05' WHERE faculty_id=5;
UPDATE faculty SET dob='1981-08-25' WHERE faculty_id=6;
UPDATE faculty SET dob='1979-01-14' WHERE faculty_id=7;
UPDATE faculty SET dob='1983-07-19' WHERE faculty_id=8;
UPDATE faculty SET dob='1977-10-30' WHERE faculty_id=9;
UPDATE faculty SET dob='1984-02-22' WHERE faculty_id=10;

SELECT faculty_id,
       name,
       dob,
       TIMESTAMPDIFF(YEAR, dob, CURDATE()) AS age,
       DATE_ADD(dob, INTERVAL 60 YEAR) AS retirement_date
FROM faculty;
INSERT INTO course(course_id,department_id,course_name)
VALUES (1,1,'Computer Science');

SELECT course_name, COUNT(*)
FROM course
GROUP BY course_name
HAVING COUNT(*) > 1;

select * from course;

CREATE TABLE savings_account (
    savings_id INT AUTO_INCREMENT PRIMARY KEY,
    account_id INT NOT NULL,
    interest_rate DECIMAL(4,2) DEFAULT 4.00,
    opening_date DATE,
    minimum_balance DECIMAL(10,2) DEFAULT 1000,

    FOREIGN KEY(account_id)
        REFERENCES account(account_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);
CREATE TABLE employee (
    employee_id INT AUTO_INCREMENT PRIMARY KEY,
    employee_name VARCHAR(200) NOT NULL,
    branch_id INT NOT NULL,
    dob DATE NOT NULL,

    FOREIGN KEY(branch_id)
        REFERENCES branch(branch_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
) ENGINE = InnoDB;
INSERT INTO employee(employee_name, branch_id, dob) VALUES
('Ravi',1,'1990-05-12'),
('Kumar',2,'1988-03-10'),
('Suresh',3,'1992-08-21'),
('Mani',4,'1985-12-01'),
('Arun',5,'1991-06-15'),
('Deepak',6,'1989-09-09'),
('Anitha',7,'1993-11-20'),
('Priya',8,'1990-07-25'),
('Lakshmi',9,'1987-04-05'),
('John',10,'1994-01-30');
show tables;
ALTER TABLE customer ADD dob DATE;
ALTER TABLE employee ADD dob DATE;
SELECT employee_name,
       TIMESTAMPDIFF(YEAR, dob, CURDATE()) AS age
FROM employee;

