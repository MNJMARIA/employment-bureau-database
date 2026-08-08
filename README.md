# Employment Bureau DB — Relational Database System

[![Oracle Database](https://img.shields.io/badge/Oracle%20Database-23ai-red)](https://www.oracle.com/database/)
[![SQL](https://img.shields.io/badge/SQL-Oracle%20SQL-blue)](https://www.oracle.com/database/sqldeveloper/)
[![PL/SQL](https://img.shields.io/badge/PL%2FSQL-Oracle-orange)](https://www.oracle.com/database/plsql/)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

Relational database system for an employment bureau, developed as a coursework project for the "Database Systems" discipline (Software Engineering, Igor Sikorsky Kyiv Polytechnic Institute, 2025).

The system is designed to automate the management of employers, job vacancies, candidates, resumes, applications, interviews, skills, education, and work experience.

The database supports candidate-to-vacancy matching, vacancy and candidate search, application status tracking, analytical reporting, and business rule enforcement at the database level.

## Project Highlights

- **17 interconnected entities**
- **3NF normalized relational model**
- **8 PL/SQL triggers** enforcing business rules
- **5 database views** for analytical reporting
- **25 analytical SQL queries**
- **Primary & foreign key constraints**
- **Business rule enforcement at database level**
- **Candidate-to-vacancy matching logic**

## Technologies

- **Oracle Database 23ai Free**
- **SQL**
- **PL/SQL**
- **Oracle SQL Developer**
- **Oracle SQL Developer Data Modeler**

## Features

### Employer Management
- Store employer information and company details
- Manage employer contacts
- Track verification and activity status

### Vacancy Management
- Create and manage job vacancies
- Specify salary ranges, schedules, experience requirements, and age restrictions
- Associate vacancies with multiple cities
- Track vacancy activity status

### Candidate & Resume Management
- Store candidate personal information
- Manage resumes and desired salary
- Store education and work experience
- Manage professional skills and skill levels

### Application & Interview Management
- Track applications submitted for vacancies
- Manage application statuses
- Store interview information, types, statuses, and notes

### Candidate Matching
- Match candidates with vacancies based on specialty
- Take age and work experience requirements into account
- Display candidate skills and relevant resume information

### Business Logic
- Data integrity through primary and foreign keys
- `NOT NULL`, `UNIQUE`, and `CHECK` constraints
- PL/SQL triggers for complex business rules
- Automatic calculation and validation of employment-related data
- Automatic vacancy status management
- Validation of age restrictions and work experience requirements

### Database Views
- Active vacancies
- Full candidate profiles
- Vacancy-candidate matching
- Specialty statistics
- Application summaries

### Analytical SQL Queries
- Vacancy search and filtering
- Candidate selection
- Salary and specialty statistics
- Application analysis
- Candidate and vacancy comparison
- Reporting and aggregation using Oracle SQL functions

## Database Structure

The database contains interconnected entities representing the main processes of an employment bureau:

- Employers
- Contacts
- Specialties
- Cities
- Vacancies
- Candidates
- Resumes
- Education
- Work Experience
- Skills
- Resume Skills
- Vacancy Cities
- Applications
- Application Statuses
- Interviews
- Interview Statuses
- Interview Types

The relational model was normalized to the **Third Normal Form (3NF)** to reduce data redundancy and prevent insertion, update, and deletion anomalies.

## SQL Scripts

The `sql/` directory contains scripts required to recreate and populate the database:

| File | Description |
|---|---|
| `01_create_tables.sql` | Database tables, primary keys, foreign keys, and constraints |
| `02_create_triggers.sql` | PL/SQL triggers implementing business rules |
| `03_create_views.sql` | Database views for common analytical and business operations |
| `04_insert_data.sql` | Test and demonstration data |
| `05_queries.sql` | SQL queries demonstrating database functionality |

### Execution Order

Scripts should be executed in the following order:

```text
01_create_tables.sql
        ↓
02_create_triggers.sql
        ↓
03_create_views.sql
        ↓
04_insert_data.sql
        ↓
05_queries.sql
```

## The Process

This project followed the full database development lifecycle:

- Subject domain analysis
- Identification of entities, attributes, relationships, and business rules
- Conceptual database modeling
- ER diagram development using Crow's Foot notation
- Transformation of the conceptual model into a relational model
- Database normalization to 3NF
- Physical database implementation in Oracle Database 23ai
- Implementation of integrity constraints
- Implementation of PL/SQL triggers
- Creation of database views
- Import and preparation of test data
- Development and testing of SQL queries
- Database structure and query result verification
- Coursework documentation

The database was designed to ensure data integrity while supporting the main business processes of an employment bureau.

## What I Learned

- Relational database design and normalization
- ER modeling and relational schema design
- Writing complex Oracle SQL queries
- Working with `JOIN`, subqueries, aggregation, and analytical functions
- Implementing database constraints
- Developing PL/SQL triggers
- Creating and using database views
- Designing many-to-many relationships
- Working with Oracle-specific data types and functions
- Testing database business rules
- Structuring a database project for reproducibility

## Documentation

The complete coursework documentation is available in the `docs/` directory. It includes:

- Subject domain analysis
- Business requirements and rules
- ER model
- Relational database structure
- Database implementation
- Trigger and view descriptions
- Test data
- SQL queries and their results
- Conclusions

## Diagrams

The `diagrams/` directory contains the database models and diagrams created during the design process.

## Screenshots

<img src="screenshots/database-model.png" width="80%">
<p><em>Database relational model</em></p>

<img src="screenshots/tables.png" width="70%">
<p><em>Database tables in Oracle SQL Developer</em></p>

<img src="screenshots/query-result.png" width="80%">
<p><em>Example of SQL query execution</em></p>

---

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

**Author:** Mariia Stepanova  
**Program:** Software Engineering  
**Institution:** Igor Sikorsky Kyiv Polytechnic Institute (Kyiv, Ukraine)  
**Year:** 2025
