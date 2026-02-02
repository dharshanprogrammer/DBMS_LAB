show tables;
select * from bill;
select * from connection;
select * from consumer;
select * from payment;
select * from tarif;
ALTER TABLE bill ADD prev_reading INT DEFAULT 0;
ALTER TABLE bill ADD curr_reading INT DEFAULT 0;

UPDATE bill
SET bill_amount = 100


