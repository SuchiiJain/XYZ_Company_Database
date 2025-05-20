DROP DATABASE xyz_company;
DROP USER 'xyz_admin'@'localhost';

CREATE DATABASE xyz_company;
CREATE USER 'xyz_admin'@'localhost' IDENTIFIED BY '12345678';

GRANT ALL ON xyz_company.* TO 'xyz_admin'@'localhost';
FLUSH PRIVILEGES;

USE xyz_company;

CREATE TABLE Department (
    department_id VARCHAR(10) PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL
);

CREATE TABLE Person (
    person_id VARCHAR(10) PRIMARY KEY,
    last_name VARCHAR(50) NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    age INT CHECK (age < 65),
    gender VARCHAR(10),
    address_line1 VARCHAR(100),
    address_line2 VARCHAR(100),
    city VARCHAR(50),
    state VARCHAR(20),
    zipcode VARCHAR(10)
);

CREATE TABLE Phone (
    person_id VARCHAR(10),
    phone_number VARCHAR(15),
    PRIMARY KEY (person_id, phone_number),
    FOREIGN KEY (person_id) REFERENCES Person(person_id)
);

CREATE TABLE Employee (
    person_id VARCHAR(10) PRIMARY KEY,
    employee_rank VARCHAR(50),
    title VARCHAR(50),
    supervisor_id VARCHAR(10),
    FOREIGN KEY (person_id) REFERENCES Person(person_id),
    FOREIGN KEY (supervisor_id) REFERENCES Employee(person_id)
);

CREATE TABLE Customer (
    person_id VARCHAR(10) PRIMARY KEY,
    preferred_sales_rep_id VARCHAR(10),
    FOREIGN KEY (person_id) REFERENCES Person(person_id),
    FOREIGN KEY (preferred_sales_rep_id) REFERENCES Employee(person_id)
);
CREATE TABLE Potential_Employee (
    person_id VARCHAR(10) PRIMARY KEY,
    FOREIGN KEY (person_id) REFERENCES Person(person_id)
);

CREATE TABLE Department_Assignment (
    person_id VARCHAR(10),
    department_id VARCHAR(10),
    start_time DATETIME,
    end_time DATETIME,
    PRIMARY KEY (person_id, start_time),
    FOREIGN KEY (person_id) REFERENCES Employee(person_id),
    FOREIGN KEY (department_id) REFERENCES Department(department_id)
);

CREATE TABLE Job_Position (
    job_id VARCHAR(10) PRIMARY KEY,
    job_description TEXT,
    posted_date DATE,
    department_id VARCHAR(10),
    FOREIGN KEY (department_id) REFERENCES Department(department_id)
);

CREATE TABLE Job_Application (
    job_id VARCHAR(10),
    person_id VARCHAR(10),
    PRIMARY KEY (job_id, person_id),
    FOREIGN KEY (job_id) REFERENCES Job_Position(job_id),
    FOREIGN KEY (person_id) REFERENCES Person(person_id)
);

CREATE TABLE Interview (
    interview_id INT AUTO_INCREMENT PRIMARY KEY,
    job_id VARCHAR(10),
    interviewee_id VARCHAR(10),
    interviewer_id VARCHAR(10),
    interview_time DATETIME,
    grade INT CHECK (grade BETWEEN 0 AND 100),
    FOREIGN KEY (job_id) REFERENCES Job_Position(job_id),
    FOREIGN KEY (interviewee_id) REFERENCES Person(person_id),
    FOREIGN KEY (interviewer_id) REFERENCES Person(person_id)
);

CREATE TABLE Product (
    product_id VARCHAR(10) PRIMARY KEY,
    product_type VARCHAR(50),
    size VARCHAR(50),
    list_price DECIMAL(10,2),
    weight DECIMAL(10,2),
    style VARCHAR(50)
);

CREATE TABLE Marketing_Site (
    site_id VARCHAR(10) PRIMARY KEY,
    site_name VARCHAR(100),
    site_location VARCHAR(100)
);

CREATE TABLE Site_Assignment (
    person_id VARCHAR(10),
    site_id VARCHAR(10),
    PRIMARY KEY (person_id, site_id),
    FOREIGN KEY (person_id) REFERENCES Person(person_id),
    FOREIGN KEY (site_id) REFERENCES Marketing_Site(site_id)
);

CREATE TABLE Sale_History (
    sale_id INT AUTO_INCREMENT PRIMARY KEY,
    salesman_id VARCHAR(10),
    customer_id VARCHAR(10),
    product_id VARCHAR(10),
    sale_time DATETIME,
    site_id VARCHAR(10),
    FOREIGN KEY (salesman_id) REFERENCES Employee(person_id),
    FOREIGN KEY (customer_id) REFERENCES Customer(person_id),
    FOREIGN KEY (product_id) REFERENCES Product(product_id),
    FOREIGN KEY (site_id) REFERENCES Marketing_Site(site_id)
);

CREATE TABLE Vendor (
    vendor_id VARCHAR(10) PRIMARY KEY,
    name VARCHAR(100),
    address VARCHAR(255),
    account_number VARCHAR(20),
    credit_rating INT,
    web_service_url VARCHAR(255)
);

CREATE TABLE Part_Type (
    part_type_id VARCHAR(10) PRIMARY KEY,
    name VARCHAR(100),
    weight DECIMAL(10,2)
);

CREATE TABLE Vendor_Part (
    vendor_id VARCHAR(10),
    part_type_id VARCHAR(10),
    price DECIMAL(10,2),
    PRIMARY KEY (vendor_id, part_type_id),
    FOREIGN KEY (vendor_id) REFERENCES Vendor(vendor_id),
    FOREIGN KEY (part_type_id) REFERENCES Part_Type(part_type_id)
);

CREATE TABLE Product_Part (
    product_id VARCHAR(10),
    part_type_id VARCHAR(10),
    quantity INT,
    PRIMARY KEY (product_id, part_type_id),
    FOREIGN KEY (product_id) REFERENCES Product(product_id),
    FOREIGN KEY (part_type_id) REFERENCES Part_Type(part_type_id)
);

CREATE TABLE Salary (
    person_id VARCHAR(10),
    transaction_number VARCHAR(20),
    pay_date DATE,
    amount DECIMAL(10,2),
    PRIMARY KEY (person_id, transaction_number),
    FOREIGN KEY (person_id) REFERENCES Employee(person_id)
);

SELECT * FROM vendor_part WHERE part_type_id = 'PT001';
