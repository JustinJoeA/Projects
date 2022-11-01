-- NO 1
USE weapon_store
GO
CREATE VIEW [view weapon ammo] AS
SELECT weapon_name, weapon_price,ammo_size
FROM weapon
WHERE ammo_size LIKE ('5.56×45mm NATO')

--NO 2
--2.	Display purchase_id, staff_name, staff_phone, and transaction_date for every staff
--which handle transaction with customer name’s is more than 12 characters.
--(in, len)

SELECT purchase_id, staff_name, staff_phone
FROM purchase_header ph
JOIN staff s ON s.staff_id = ph.staff_id
JOIN customer c ON c.customer_id = ph.customer_id
AND ph.customer_id in(
SELECT customer_name
FROM customer
WHERE LEN(customer_name) = 12
)
-- NO 3
SELECT 
[Total transaction] = COUNT(purchase_id)
FROM staff S
JOIN purchase_header ph ON s.staff_id = ph.staff_id
WHERE purchase_id in (
 SELECT 
 FROM staff
)

-- NO 4
SELECT customer_name, staff_name,
[Total Transaction]
FROM customer c
JOIN purchase_header ph ON c.customer_id= ph.customer_id
JOIN staff s ON ph.staff_id = s.staff_id

-- NO 5
SELECT
[Customer Name] = UPPER(customer_name)
FROM customer c
JOIN purchase_header ph
on c.customer_id = ph.customer_id
join purchase_detail pd
on ph.purchase_id = pd.purchase_id
join weapon w
on w.weapon_id  =pd.weapon_id
WHERE pd.purchase_id IN (
SELECT transaction_date,
MONTH(12)
FROM purchase_header
)
