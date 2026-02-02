show tables;
select * from account;
select * from bank;
select * from card;
select * from bank_transaction;
select * from machine;
select * from refill;
select * from transaction;
ALTER TABLE refill
ADD refill_date DATE;
INSERT INTO refill 
(refill_id, machine_id, denom_2000, demom_500, denom_200, refill_date)
VALUES
(1,1,10,20,30,'2026-01-20'),
(2,2,5,10,15,'2026-01-20'),
(3,3,8,12,10,'2026-01-21'),
(4,4,6,14,20,'2026-01-21'),
(5,5,12,10,5,'2026-01-22'),
(6,1,7,15,25,'2026-01-22'),
(7,2,9,18,12,'2026-01-23'),
(8,3,11,20,10,'2026-01-23'),
(9,4,4,8,16,'2026-01-24'),
(10,5,15,25,30,'2026-01-24');

SELECT 
    t.txn_date AS Day,
    b.bank_name,
    a.customer_name
FROM transaction t
JOIN account a ON t.account_id = a.account_id
JOIN machine m ON t.machine_id = m.machine_id
JOIN bank b ON m.bank_id = b.bank_id
ORDER BY Day, b.bank_name;

SELECT 
    txn_date AS Day,
    SUM(amount) AS Total_Withdrawn
FROM transaction
WHERE txn_type = 'Withdraw'
GROUP BY txn_date;

SELECT 
    refill_date AS Day,
    SUM(denom_2000) AS Notes_2000,
    SUM(demom_500) AS Notes_500,
    SUM(denom_200) AS Notes_200,
    SUM(denom_2000*2000 + demom_500*500 + denom_200*200) AS Total_Refilled
FROM refill
GROUP BY refill_date;

SELECT 
    m.machine_id,
    m.location,
    MAX(t.txn_date) AS Last_Transaction_Date,
    DATEDIFF(CURDATE(), MAX(t.txn_date)) AS Idle_Days
FROM machine m
LEFT JOIN transaction t
    ON m.machine_id = t.machine_id
GROUP BY m.machine_id, m.location;

ALTER TABLE machine ADD status VARCHAR(50) DEFAULT 'Working';
ALTER TABLE machine ADD out_of_order_date DATE;

UPDATE machine
SET status = 'OutOfOrder',
    out_of_order_date = '2026-01-15'
WHERE machine_id = 3;

UPDATE machine
SET status = 'OutOfOrder',
    out_of_order_date = '2026-01-18'
WHERE machine_id = 5;

SELECT 
    machine_id,
    location,
    status,
    out_of_order_date,
    DATEDIFF(CURDATE(), out_of_order_date) AS OutOfOrder_Days
FROM machine
WHERE status = 'OutOfOrder';


