
insert into Person (Person_ID, Last_Name, First_Name, Age, Gender, Address_Line1, Address_Line2, City, State, Zipcode)
values 
('P001', 'Cole', 'Hellen', 30, 'Female', '123 Elm St', NULL, 'Dallas', 'TX', '75001'),
('P002', 'Smith', 'John', 40, 'Male', '456 Oak St', NULL, 'Dallas', 'TX', '75002'),
('P003', 'Lee', 'Alice', 29, 'Female', '789 Pine Rd', NULL, 'Plano', 'TX', '75093');


insert into Employee (Person_ID, employee_rank, Title, Supervisor_ID)
values 
('P002', 'Senior', 'Manager', NULL),
('P003', 'Junior', 'Analyst', 'P002');


insert into Customer (Person_ID, Preferred_Sales_Rep_ID)
values ('P001', 'P002');


insert into Department (Department_ID, Department_Name)
values 
('D001', 'Marketing'),
('D002', 'Engineering');


insert into Job_Position (Job_ID, Job_Description, Posted_Date, Department_ID)
values 
('11111', 'Data Analyst Role', '2011-01-10', 'D001'),
('12345', 'Software Intern', '2011-01-15', 'D002');


insert into Job_Application (Job_ID, Person_ID)
values ('12345', 'P003');


insert into Interview (Interview_ID, Job_ID, Interviewee_ID, Interviewer_ID, Interview_Time, Grade)
values 
(1, '11111', 'P001', 'P002', '2011-01-15 09:00:00', 75),
(2, '11111', 'P001', 'P003', '2011-01-20 09:00:00', 80);


insert into Product (Product_ID, Product_Type, Size, List_Price, Weight, Style)
values ('PR001', 'T-Shirt', 'M', 25.00, 0.50, 'Casual');

insert into Marketing_Site (Site_ID, Site_Name, Site_Location)
values ('S001', 'Downtown Dallas', 'Dallas, TX');


insert into Sale_History (Sale_ID, Salesman_ID, Customer_ID, Product_ID, Sale_Time, Site_ID)
values (1, 'P002', 'P001', 'PR001', '2011-03-05 10:00:00', 'S001');


insert into Salary (Person_ID, Transaction_Number, Pay_Date, Amount)
values 
('P002', 'TX1001', '2023-01-31', 5000.00),
('P002', 'TX1002', '2023-02-28', 5200.00);

insert into part_type (part_type_id, name, weight)
values ('PT001', 'Cup', 1.5);
insert into product_part (product_id, part_type_id, quantity)
values ('PR001', 'PT001', 3);

INSERT INTO vendor (vendor_id, name, address, account_number, credit_rating, web_service_url)
VALUES ('V001', 'PartCo', '123 Supply Rd', 'ACCT001', 5, 'https://vendor.example.com');

INSERT INTO vendor_part (vendor_id, part_type_id, price)
VALUES ('V001', 'PT001', 2.00);

-- ADDITIONAL PEOPLE (P006–P015)
insert into Person (person_id, last_name, first_name, age, gender, address_line1, address_line2, city, state, zipcode) values
('P006', 'Nguyen', 'Tina', 32, 'Female', '800 New St', NULL, 'Allen', 'TX', '75013'),
('P007', 'Kim', 'David', 28, 'Male', '801 Elm Dr', NULL, 'Plano', 'TX', '75074'),
('P008', 'Jones', 'Emily', 45, 'Female', '123 Creek Rd', NULL, 'McKinney', 'TX', '75070'),
('P009', 'Sharma', 'Amit', 36, 'Male', '456 Spring Ln', NULL, 'Dallas', 'TX', '75001'),
('P010', 'Ali', 'Sara', 31, 'Female', '901 Ridge St', NULL, 'Irving', 'TX', '75063'),
('P011', 'Wang', 'Kevin', 33, 'Male', '789 Summer St', NULL, 'Plano', 'TX', '75075'),
('P012', 'Garcia', 'Mia', 26, 'Female', '321 Oak Cir', NULL, 'Frisco', 'TX', '75034'),
('P013', 'Roberts', 'James', 39, 'Male', '654 Brook Blvd', NULL, 'Carrollton', 'TX', '75006'),
('P014', 'Singh', 'Priya', 29, 'Female', '210 Forest Rd', NULL, 'Allen', 'TX', '75013'),
('P015', 'Chen', 'Leo', 42, 'Male', '555 Lakeside Dr', NULL, 'The Colony', 'TX', '75056');

-- PHONE
insert into Phone (person_id, phone_number) values
('P006', '2146660000'),
('P007', '2147770000'),
('P008', '2148880000'),
('P009', '2149990000'),
('P010', '2141010101'),
('P011', '2142020202'),
('P012', '2143030303'),
('P013', '2144040404'),
('P014', '2145050505'),
('P015', '2146060606');

-- POTENTIAL EMPLOYEES
insert into Potential_Employee (person_id) values
('P006'), ('P007'), ('P010'), ('P012'), ('P014');

insert into Employee (person_id, employee_rank, title, supervisor_id) values
('P009', 'Senior', 'Lead Engineer', NULL),
('P013', 'Senior', 'Advisor', NULL);

insert into Employee (person_id, employee_rank, title, supervisor_id) values
('P007', 'Junior', 'Intern', 'P013'),
('P008', 'Mid', 'Consultant', 'P013'),
('P010', 'Junior', 'Recruiter', 'P009'),
('P011', 'Mid', 'Coordinator', 'P009'),
('P015', 'Junior', 'Designer', 'P009');

-- SALARIES
insert into Salary (person_id, transaction_number, pay_date, amount) values
('P007', 'TX007', '2023-03-31', 3000.00),
('P008', 'TX008', '2023-03-31', 4700.00),
('P009', 'TX009', '2023-03-31', 5800.00),
('P010', 'TX010', '2023-03-31', 3100.00),
('P011', 'TX011', '2023-03-31', 4600.00),
('P013', 'TX013', '2023-03-31', 6200.00),
('P015', 'TX015', '2023-03-31', 3300.00);

-- NEW PRODUCTS (PR003–PR006)
insert into Product (product_id, product_type, size, list_price, weight, style) values
('PR003', 'Notebook', 'A5', 12.00, 0.2, 'Office'),
('PR004', 'Pen', 'Standard', 3.00, 0.05, 'Stationery'),
('PR005', 'Backpack', 'L', 45.00, 1.2, 'Travel'),
('PR006', 'Water Bottle', 'M', 18.00, 0.6, 'Fitness');

-- PART TYPES (PT003–PT006)
insert into Part_Type (part_type_id, name, weight) values
('PT003', 'Paper', 0.1),
('PT004', 'Plastic', 0.2),
('PT005', 'Zipper', 0.3),
('PT006', 'Steel', 0.4);

-- VENDORS (V003–V004)
insert into Vendor (vendor_id, name, address, account_number, credit_rating, web_service_url) values
('V003', 'OfficePro', '88 Supply Blvd', 'AC3003', 5, 'https://vendor3.com'),
('V004', 'FitnessMax', '777 Gym Ave', 'AC4004', 4, 'https://vendor4.com');

-- VENDOR PARTS
insert into Vendor_Part (vendor_id, part_type_id, price) values
('V003', 'PT003', 0.50),
('V003', 'PT004', 0.20),
('V003', 'PT005', 0.80),
('V004', 'PT006', 1.50);

-- PRODUCT PARTS
insert into Product_Part (product_id, part_type_id, quantity) values
('PR003', 'PT003', 10),
('PR004', 'PT004', 5),
('PR005', 'PT005', 2),
('PR006', 'PT006', 1);

-- MARKETING SITES
insert into Marketing_Site (site_id, site_name, site_location) values
('S004', 'Galleria Mall', 'Dallas, TX'),
('S005', 'Watters Creek', 'Allen, TX');

insert into Person (person_id, last_name, first_name, age, gender, address_line1, address_line2, city, state, zipcode)
values ('P005', 'Patel', 'Riya', 27, 'Female', '222 Maple St', NULL, 'Frisco', 'TX', '75033');

insert into Customer (person_id, preferred_sales_rep_id)
values ('P005', 'P003');

-- SALES
insert into Sale_History (sale_id, salesman_id, customer_id, product_id, sale_time, site_id) values
(3, 'P008', 'P001', 'PR003', '2011-02-10 12:00:00', 'S004'),
(4, 'P009', 'P005', 'PR004', '2011-03-12 14:00:00', 'S005'),
(5, 'P013', 'P001', 'PR005', '2011-03-28 15:30:00', 'S004');

insert into Department (department_id, department_name) values
('D003', 'Sales');

insert into Job_Position (job_id, job_description, posted_date, department_id) values
('44444', 'Product Manager', '2011-04-10', 'D001'),
('55555', 'UX Designer', '2011-04-12', 'D003');

-- JOB APPLICATIONS
insert into Job_Application (job_id, person_id) values
('44444', 'P006'),
('55555', 'P014');

insert into Person (person_id, last_name, first_name, age, gender, address_line1, address_line2, city, state, zipcode)
values
('P004', 'Brown', 'Michael', 35, 'Male', '321 Pine Ln', null, 'Irving', 'TX', '75060');

-- INTERVIEWS
insert into Interview (interview_id, job_id, interviewee_id, interviewer_id, interview_time, grade) values
(8, '44444', 'P006', 'P002', '2011-04-15 09:00:00', 72),
(9, '55555', 'P014', 'P004', '2011-04-17 11:00:00', 78);

insert into Marketing_Site (site_id, site_name, site_location) values
('S101', 'Downtown Dallas', 'Dallas, TX'),
('S102', 'Legacy West', 'Plano, TX'),
('S103', 'Galleria Tower', 'Frisco, TX');

insert into product (product_id, product_type, size, list_price, weight, style) values
('PR100', 'Luxury Chair', 'L', 300.00, 12.0, 'Office'),
('PR101', 'Ergo Desk', 'XL', 450.00, 20.0, 'Office');

-- Sales of both types by same salesman (e.g., P002)
insert into sale_history (sale_id, salesman_id, customer_id, product_id, sale_time, site_id) values
(900, 'P002', 'P001', 'PR100', '2011-03-01 10:00:00', 'S001'),
(901, 'P002', 'P001', 'PR101', '2011-03-02 10:00:00', 'S001');

INSERT IGNORE INTO person (person_id, last_name, first_name, age, gender, address_line1, address_line2, city, state, zipcode) VALUES
('P001', 'Cole', 'Hellen', 30, 'Female', '123 Elm St', NULL, 'Dallas', 'TX', '75001'),
('P002', 'Smith', 'John', 40, 'Male', '456 Oak St', NULL, 'Dallas', 'TX', '75002');

INSERT IGNORE INTO employee (person_id, employee_rank, title, supervisor_id) VALUES
('P002', 'Senior', 'Sales Lead', NULL);
INSERT IGNORE INTO customer (person_id, preferred_sales_rep_id) VALUES
('P001', 'P002');

INSERT IGNORE INTO marketing_site (site_id, site_name, site_location) VALUES
('S001', 'Demo Site', 'Dallas, TX');

INSERT IGNORE INTO product (product_id, product_type, size, list_price, weight, style) VALUES
('PR100', 'Luxury Chair', 'L', 300.00, 12.0, 'Office'),
('PR101', 'Ergo Desk', 'XL', 450.00, 20.0, 'Office');

INSERT IGNORE INTO sale_history (sale_id, salesman_id, customer_id, product_id, sale_time, site_id) VALUES
(900, 'P002', 'P001', 'PR100', '2011-03-01 10:00:00', 'S001'),
(901, 'P002', 'P001', 'PR101', '2011-03-02 10:00:00', 'S001');

INSERT INTO department_assignment (person_id, department_id, start_time, end_time)
VALUES ('P003', 'D002', '2023-01-01', NULL);

INSERT IGNORE INTO department (department_id, department_name) VALUES
('D001', 'Marketing'),
('D002', 'Engineering'),
('D003', 'Sales');

INSERT INTO department_assignment (person_id, department_id, start_time, end_time) VALUES
('P002', 'D001', '2023-01-01', NULL),
('P002', 'D002', '2023-02-01', NULL),
('P002', 'D003', '2023-03-01', NULL);

INSERT INTO interview (interview_id, job_id, interviewee_id, interviewer_id, interview_time, grade) VALUES
(20, '12345', 'P003', 'P002', '2011-02-01 09:00:00', 80),
(21, '12345', 'P003', 'P002', '2011-02-02 09:00:00', 85),
(22, '12345', 'P003', 'P002', '2011-02-03 09:00:00', 90),
(23, '12345', 'P003', 'P002', '2011-02-04 09:00:00', 88),
(24, '12345', 'P003', 'P002', '2011-02-05 09:00:00', 92);

INSERT IGNORE INTO person (person_id, last_name, first_name, age, gender, address_line1, address_line2, city, state, zipcode)
VALUES ('P009', 'Sharma', 'Amit', 36, 'Male', '456 Spring Ln', NULL, 'Dallas', 'TX', '75001');

INSERT IGNORE INTO phone (person_id, phone_number)
VALUES ('P009', '2149990000');

INSERT INTO interview (interview_id, job_id, interviewee_id, interviewer_id, interview_time, grade) VALUES
(1001, '12345', 'P009', 'P002', '2011-03-01 09:00:00', 75),
(1002, '12345', 'P009', 'P002', '2011-03-02 09:00:00', 80),
(1003, '12345', 'P009', 'P002', '2011-03-03 09:00:00', 85),
(1004, '12345', 'P009', 'P002', '2011-03-04 09:00:00', 90),
(1005, '12345', 'P009', 'P002', '2011-03-05 09:00:00', 95);


