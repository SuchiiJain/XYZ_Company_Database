-- INSERT
INSERT INTO Person (person_id, last_name, first_name, age, gender, address_line1, address_line2, city, state, zipcode)
VALUES ('P020', 'Allen', 'Grace', 34, 'Female', '456 New Ave', NULL, 'Dallas', 'TX', '75201');

INSERT INTO Person (person_id, last_name, first_name, age, gender, address_line1, address_line2, city, state, zipcode)
VALUES ('P021', 'Martinez', 'Carlos', 29, 'Male', '789 Bay St', NULL, 'Plano', 'TX', '75074');

INSERT INTO Customer (person_id, preferred_sales_rep_id)
VALUES ('P021', 'P002');

INSERT INTO Product (product_id, product_type, size, list_price, weight, style)
VALUES ('PR010', 'Desk Chair', 'L', 120.00, 7.5, 'Office');

INSERT INTO Job_Position (job_id, job_description, posted_date, department_id)
VALUES ('99999', 'Content Strategist', '2011-05-01', 'D001');

INSERT INTO Part_Type (part_type_id, name, weight)
VALUES ('PT999', 'Foam', 0.6);


-- UPDATE
UPDATE Employee SET title = 'Senior Analyst' WHERE person_id = 'P003';

UPDATE Employee
SET `rank` = 'Senior', title = 'Lead Developer'
WHERE person_id = 'P004';

UPDATE Product
SET list_price = 19.99
WHERE product_id = 'PR002';

UPDATE Department
SET department_name = 'Digital Marketing'
WHERE department_id = 'D001';

UPDATE Vendor
SET credit_rating = 3
WHERE vendor_id = 'V002';


-- READ
SELECT * FROM Product WHERE list_price > 20.00;

SELECT P.first_name, P.last_name
FROM Job_Application JA
JOIN Person P ON JA.person_id = P.person_id
WHERE JA.job_id = '12345';

SELECT * FROM Sale_History
WHERE site_id = 'S001';

SELECT E.person_id, P.first_name, P.last_name, E.supervisor_id
FROM Employee E
JOIN Person P ON E.person_id = P.person_id;

SELECT site_id, site_location
FROM Marketing_Site
WHERE site_id NOT IN 
(
    SELECT DISTINCT site_id FROM Sale_History
);


-- DELETE
DELETE FROM Job_Position WHERE job_id = '22222';

DELETE FROM Interview WHERE interview_id = 3;
