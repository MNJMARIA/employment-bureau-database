# Employment Bureau Database

A relational database system for an employment bureau developed using Oracle Database 23ai Free, SQL and PL/SQL.

## Overview

The database is designed to support the main processes of an employment bureau, including:

- employer and contact management
- vacancy management
- candidate and resume management
- education and work experience
- professional skills
- job applications
- interviews
- candidate-to-vacancy matching
- analytical reporting

The database was designed with normalization up to the Third Normal Form (3NF) and includes integrity constraints and business rules implemented at the database level.

## Technologies

- Oracle Database 23ai Free
- SQL
- PL/SQL
- Oracle SQL Developer
- Oracle SQL Developer Data Modeler

## Database Features

- Relational database design
- Primary and foreign keys
- `NOT NULL`, `UNIQUE` and `CHECK` constraints
- `ON DELETE CASCADE`
- Identity columns for automatic ID generation
- PL/SQL triggers for business rules
- Database views for reporting and data analysis
- Test data
- Complex SQL queries using multiple tables
- Candidate-to-vacancy matching

## Database Structure

The database contains entities representing:

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
- Applications
- Interviews
- Application Statuses
- Interview Statuses
- Interview Types
- and related entities

## SQL Scripts

The SQL implementation is organized into separate scripts:

| Script | Description |
|---|---|
| `01_create_tables.sql` | Creates database tables, primary keys, foreign keys and constraints |
| `02_create_triggers.sql` | Creates PL/SQL triggers implementing business rules |
| `03_create_views.sql` | Creates database views for reporting and data analysis |
| `04_insert_data.sql` | Inserts test data into the database |
| `05_queries.sql` | Contains SQL queries demonstrating system functionality |

### Execution Order

Run the scripts in the following order:

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
