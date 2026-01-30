SELECT employee_id,
       employee_name,
       dob,
       TIMESTAMPDIFF(YEAR, dob, CURDATE()) AS employee_age
FROM employee;

SELECT customer_id,
       customer_name,
       dob,
       TIMESTAMPDIFF(YEAR, dob, CURDATE()) AS customer_age
FROM customer;

ALTER TABLE customer ADD status VARCHAR(20) DEFAULT 'active';

select * from customer;
show tables;

UPDATE customer
SET status = 'lock'
WHERE customer_id IN (
    SELECT a.customer_id
    FROM account a
    LEFT JOIN bank_transaction t
           ON a.account_id = t.account_id
    GROUP BY a.customer_id
    HAVING MAX(t.txn_date) < DATE_SUB(CURDATE(), INTERVAL 2 YEAR)
       OR MAX(t.txn_date) IS NULL
);

SELECT customer_id, customer_name, status
FROM customer
WHERE status = 'lock';
UPDATE debit_card
SET status = 'inactive'
WHERE expiry_date <= CURDATE();
SELECT * FROM debit_card WHERE status='inactive';

