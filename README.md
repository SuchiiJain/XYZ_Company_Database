XYZ Company is a manufacturing business that procures parts from vendors to assemble and sell its products. The company operates through multiple departments, manages marketing sites, conducts recruitment and interviews, tracks sales and part usage, and maintains vendor relations. This project implements a fully normalized relational database (3NF) and a Streamlit-based UI for executing views, queries, and CRUD operations.
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
This system was developed to meet the following real-world operational needs:

  Department Management: Track the Department ID and Name for all company departments.
  
  Person Entity: All individuals (employees, customers, and job applicants) are modeled as persons with shared attributes:
    Personal ID (e.g., P001)
    Name, age (under 65), gender
    Address (multi-line), multiple phone numbers

  Employees:
    Tracked by Title, Rank, and assigned Supervisor
    Work for exactly one department at any time
    Shift history is recorded (start and end times)

  Job Application and Hiring:
    Jobs are posted by departments with a job ID, description, and posted date
    Employees and job seekers can apply
    Multi-round interviews are conducted
    Selection is based on ≥5 passing rounds and an average grade > 70

  Product Inventory:
    Product ID, Type, Size, Price, Weight, and Style are recorded

  Sales and Marketing Sites:
    Sales history is linked to sites, salespeople, customers, and products
    Sites include ID, location, and assigned personnel

  Vendor and Part Procurement:
    Vendors supply parts with consistent per-vendor pricing
    Parts are linked to products via part-type usage quantities
    Vendor details include credit rating, account number, and web service URL

  Employee Payroll:
    Monthly salary includes transaction number, pay date, and amount
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Database Design Deliverables:

  Conceptual Design:
    ER and EER diagrams represent the supertype/subtype hierarchy and M:N relationships
    Subclassing is used for modeling multi-role persons (employees, customers, applicants)

  Logical Design:
    Multi-valued and M:N relationships transformed into relational schemas
    All tables normalized to 3NF
    Dependency diagrams were created for all relations

  Implementation:
    MySQL is used for schema creation and data operations
    All primary and foreign keys are defined explicitly
    SQL includes:
      Table creation scripts
      CREATE VIEW statements
      15 complex queries spanning joins, aggregates, filtering, and set logic

  Views Created:
    Average monthly salary per employee
    Interview pass counts per job per applicant
    Sales volume per product type
    Part cost per product
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Streamlit UI:
  Live view selection
  Execution of all predefined complex queries
  Full CRUD for key tables like person, including ID auto-generation
  Foreign key checks and data integrity validation
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Sample Project Questions Answered
1. Identified 5 additional business rules likely used in practice
2. Justified the use of a relational DBMS like Oracle for integrity and scalability
3. Evaluated the need for superclass/subclass modeling in mixed-role personnel
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Project Components
  ER_EER_Diagram.pdf
  Normalized_Relation_Schema.sql
  CS4347UI.py (Streamlit UI)
  DDL_DML.sql (All SQL statements)
  Dependency_Diagrams.pdf
  README.md (this file)
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Skills & Tools Used
  SQL, MySQL, Relational Modeling
  Normalization (1NF → 3NF) and Dependency Analysis
  Python, Streamlit, Plotly, Pandas
  Entity Relationship Modeling (ER/EER)
  Query optimization and multi-table joins

