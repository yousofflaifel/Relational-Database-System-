# National Disaster Management System (NDMS)

A relational database design project for the **National Disaster Management System (NDMS)**. The system organizes information about disasters, shelters, evacuees, volunteers, and coordinators to support disaster-response operations.

## Small Project Description

**NDMS is a MySQL relational database designed to manage disasters, shelters, evacuees, volunteers, and coordinators using ER modeling, normalization, primary and foreign keys, and database integrity constraints.**

## Technologies Used

- MySQL
- SQL
- MySQL Workbench
- Entity-Relationship Diagrams (ERD)
- Relational database design
- Database normalization
- Primary keys
- Foreign keys
- Composite keys
- Data integrity constraints

## System Overview

The system has four main user roles:

- **Administrator:** Full access to manage the database.
- **Coordinator:** Manages disasters, shelters, evacuees, and volunteers, but cannot delete records.
- **Volunteer:** Views assigned shelters, shifts, and relevant evacuee information.
- **Government:** Read-only access for monitoring, planning, and resource decisions.

## Main Entities

### Disaster

Stores information about disasters, including disaster ID, name, type, start date, end date, location, severity level, and coordinator.

### Shelter

Stores information about shelters, including shelter ID, name, location, capacity, occupancy, phone number, and associated disaster.

### Evacuee

Stores information about people affected by a disaster, including evacuee ID, name, date of birth, gender, shelter, and assisting volunteer.

### Volunteer

Stores volunteer information, including volunteer ID, name, phone number, and skills.

### CoordinatorInfo

Stores coordinator identification and contact information.

### VolunteerSkill

Stores volunteer skills separately because a volunteer can have multiple skills.

### Volunteer_Shelter

Resolves the many-to-many relationship between volunteers and shelters and records hours worked.

## Relationships

```text
Disaster 1 ───── M Shelter
Shelter 1 ────── M Evacuee
Volunteer 1 ──── M Evacuee
Volunteer M ───── M Shelter
                    |
                    └── Volunteer_Shelter
```

A disaster can contain multiple shelters, a shelter can contain multiple evacuees, and volunteers can work in multiple shelters.

## Database Design Process

### Conceptual Design

The conceptual model identifies the main entities, attributes, relationships, and cardinalities of the NDMS.

### Logical Design

The conceptual model is converted into relational tables:

```text
Disaster
CoordinatorInfo
Shelter
Evacuee
Volunteer
VolunteerSkill
Volunteer_Shelter
```

Primary keys identify records and foreign keys connect related entities.

### Normalization

The database is normalized through **1NF, 2NF, and 3NF**.

Examples include:

- Splitting `FullName` into `FirstName` and `LastName`.
- Moving multi-valued volunteer skills into `VolunteerSkill`.
- Removing derived `Age` because it can be calculated from `DateOfBirth`.
- Removing partial dependencies from composite-key relationships.
- Removing transitive dependencies.

## Physical Design

The database is implemented in **MySQL** with defined:

- Tables
- Columns
- Data types
- Primary keys
- Foreign keys
- Composite keys
- Constraints

Example data types include:

```text
VARCHAR
CHAR
DATE
```

## Data Integrity

The database uses constraints such as:

- `NOT NULL`
- `UNIQUE`
- `CHECK`
- `DEFAULT`
- Primary keys
- Foreign keys

For example, shelter capacity is constrained so that it cannot be negative.

## How to Run

### Requirements

- MySQL Server
- MySQL Workbench or another MySQL client
- The SQL script included in the repository

### Steps

1. Install and start MySQL.
2. Open MySQL Workbench.
3. Create the NDMS database:

```sql
CREATE DATABASE NDMS;
USE NDMS;
```

4. Run the project's SQL script.
5. Verify that all tables, keys, relationships, and constraints were created.
6. Insert sample data if provided.
7. Run SQL queries to test the database.

## Recommended Repository Structure

```text
NDMS-Database/
│
├── README.md
├── SQL/
│   └── ndms.sql
├── ERD/
│   └── conceptual-design.png
└── Screenshots/
    └── mysql-workbench.png
```

The university report does not need to be uploaded if you want to keep the repository focused on the actual database implementation.

## Learning Outcomes

This project demonstrates understanding of:

- Database requirements analysis
- ER modeling
- Conceptual, logical, and physical database design
- SQL and MySQL
- Relational database modeling
- Primary and foreign keys
- Composite keys
- Database constraints
- 1NF, 2NF, and 3NF
- Many-to-many relationships
- Data integrity and redundancy reduction

## Author

**Yousof Flaifel**

Data Science & AI Student  
Al Hussein Technical University (HTU)

---

University Database Design and Development Project
