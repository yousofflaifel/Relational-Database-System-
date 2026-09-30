# National Disaster Management System (NDMS)

A MySQL relational database project designed to support disaster-response operations by managing disasters, shelters, evacuees, volunteers, coordinators, volunteer skills, and volunteer assignments.

The project covers the database development process from requirements analysis and conceptual modeling to normalization, logical design, physical implementation, SQL operations, views, stored procedures, user privileges, and validation queries.

## Project Description

The National Disaster Management System (NDMS) is designed to improve coordination between evacuees, shelters, volunteers, and disaster coordinators.

The system stores and manages information needed during disaster events, helping track:

- Disasters and their severity
- Shelters operating under each disaster
- Evacuees staying in shelters
- Volunteers assisting evacuees
- Volunteer skills
- Volunteer assignments and hours worked
- Disaster coordinators

## Technologies Used

- MySQL
- SQL
- MySQL Workbench
- Entity-Relationship Modeling (ERD)
- Relational Database Design
- Database Normalization
- DDL
- DML
- DCL
- SQL Views
- Stored Procedures
- Primary Keys
- Foreign Keys
- Composite Keys
- Database Constraints

## Database Entities

The database contains the following main relations:

### Disaster

Stores information about each disaster:

- ID
- Name
- Type
- Start Date
- End Date
- Location
- Severity Level
- Coordinator ID

### CoordinatorInfo

Stores coordinator information:

- ID
- First Name
- Last Name
- Phone Number

### Shelter

Stores information about shelters operating during disasters:

- ID
- Name
- Location
- Capacity
- Phone Number
- Disaster ID

### Evacuee

Stores information about people affected by disasters:

- ID
- First Name
- Last Name
- Date of Birth
- Gender
- Shelter ID
- Volunteer ID

### Volunteer

Stores volunteer information:

- ID
- First Name
- Last Name
- Phone Number

### VolunteerSkill

Stores the skills associated with volunteers.

A composite primary key is used:

```text
(VolunteerID, Skill)
```

### Volunteer_Shelter

Connects volunteers and shelters through a many-to-many relationship and stores the number of hours worked.

A composite primary key is used:

```text
(VolunteerID, ShelterID)
```

## Database Relationships

```text
CoordinatorInfo 1 ───── M Disaster
Disaster        1 ───── M Shelter
Shelter         1 ───── M Evacuee
Volunteer       1 ───── M Evacuee
Volunteer       M ───── M Shelter
                         |
                         └── Volunteer_Shelter
```

A disaster can have multiple shelters, and each shelter belongs to a disaster.

A shelter can accommodate multiple evacuees.

A volunteer can assist multiple evacuees.

Volunteers can work in multiple shelters, and each shelter can have multiple volunteers. The `Volunteer_Shelter` relation resolves this many-to-many relationship and stores `HoursWorked`.

## Database Design

### Conceptual Design

The conceptual model identifies the main entities, relationships, attributes, and cardinalities of the NDMS.

The main entities are:

- Disaster
- Shelter
- Volunteer
- Evacuee

Additional entities are introduced during logical design to properly represent coordinator information, volunteer skills, and the volunteer-shelter relationship.

### Logical Design

The conceptual model is mapped into relational tables with primary keys and foreign keys.

The main relations are:

```text
Disaster
CoordinatorInfo
Shelter
Evacuee
Volunteer
VolunteerSkill
Volunteer_Shelter
```

Examples of foreign-key relationships include:

```text
Disaster.CoordinatorID → CoordinatorInfo.ID
Shelter.DisasterID → Disaster.ID
Evacuee.ShelterID → Shelter.ID
Evacuee.VolunteerID → Volunteer.ID
VolunteerSkill.VolunteerID → Volunteer.ID
Volunteer_Shelter.VolunteerID → Volunteer.ID
Volunteer_Shelter.ShelterID → Shelter.ID
```

## Normalization

The database design applies **First Normal Form (1NF), Second Normal Form (2NF), and Third Normal Form (3NF)**.

### 1NF

The design removes composite, multi-valued, and derived attributes.

Examples:

- `FullName` is divided into `FirstName` and `LastName`.
- Volunteer skills are separated into `VolunteerSkill`.
- `Age` is removed because it can be calculated from `DateOfBirth`.
- Coordinator information is separated into `CoordinatorInfo`.

### 2NF

Partial dependencies are removed from relations with composite primary keys.

For example, attributes that depend only on `ShelterID` should belong to the `Shelter` relation rather than `Volunteer_Shelter`.

### 3NF

Transitive dependencies are removed so non-key attributes depend on the appropriate primary key rather than another non-key attribute.

## Database Constraints

The implementation uses database constraints to maintain data integrity.

Examples include:

```sql
PRIMARY KEY
FOREIGN KEY
NOT NULL
UNIQUE
CHECK
DEFAULT
```

Examples from the implementation include:

- Disaster severity is restricted to `Low`, `Medium`, or `High`.
- Shelter capacity cannot be negative.
- Volunteer phone numbers are unique.
- Required first and last names cannot be NULL.
- Evacuee gender has a default value and allowed values.
- Foreign keys maintain relationships between related tables.

## SQL Implementation

The SQL implementation includes several database programming components.

### DDL

Data Definition Language is used to create the database structure and tables.

```sql
CREATE DATABASE NDMS;
```

Tables include:

```text
coordinatorInfo
Disaster
Shelter
Volunteer
VolunteerSkill
Volunteer_Shelter
Evacuee
```

### DML

Data Manipulation Language is used to populate the database with sample records using `INSERT` statements.

The sample data includes disasters, shelters, volunteers, volunteer skills, volunteer assignments, and evacuees.

### Views

The project includes views for commonly required information, including:

- `HighSeverityDisasters`
- `ShelterStatus`
- `EvacueeShelter`
- `VolunteerHoursWork`

For example, `HighSeverityDisasters` provides information about disasters with a `High` severity level, while `VolunteerHoursWork` calculates the total hours worked by each volunteer.

### Stored Procedures

The project includes stored procedures for common operations, including:

- `InsertCoordinator`
- `UpdateShelterCapacity`
- `SelectVolunteersByShelter`
- `DeleteDisaster`

These procedures demonstrate how reusable database operations can be implemented in MySQL.

### User Access Control

The project also demonstrates database-level user management using DCL.

Four user roles are defined:

| Role | Access |
|---|---|
| Administrator | Full database access |
| Coordinator | Select, insert, and update operational data |
| Volunteer | Read access to assigned volunteer and evacuee information |
| Government | Read-only access to the database |

The SQL implementation uses `CREATE USER` and `GRANT` statements to demonstrate role-based database permissions.

## How to Run

### Requirements

- MySQL Server
- MySQL Workbench or another MySQL-compatible client
- `FinalSQLCode.sql`

### Steps

1. Install and start MySQL Server.
2. Open MySQL Workbench.
3. Open `FinalSQLCode.sql`.
4. Create the NDMS database:

```sql
CREATE DATABASE NDMS;
USE NDMS;
```

5. Execute the DDL section to create the tables.
6. Execute the DML section to insert the sample data.
7. Execute the views and stored procedures sections.
8. Execute the DCL section if you want to test the different database users and permissions.
9. Run the validation queries to verify the database results.

If the SQL sections in the file are commented out, remove the surrounding SQL comments from the section you want to execute before running it.

## Validation Queries

The project includes queries for validating the database, such as:

- Finding medium- and high-severity disasters within a specific date range.
- Counting evacuees in each shelter.
- Listing volunteers and the shelters/disasters they are assigned to.
- Counting evacuees associated with each disaster.

Example:

```sql
SELECT *
FROM Disaster
WHERE StartDate BETWEEN '2025-01-01' AND '2025-12-31'
  AND SeverityLevel IN ('High', 'Medium')
ORDER BY StartDate ASC;
```

## Learning Outcomes

This project demonstrates practical understanding of:

- Database requirements analysis
- Entity-Relationship modeling
- Conceptual database design
- Logical database design
- Physical database design
- Relational database modeling
- SQL and MySQL
- Database normalization
- Primary and foreign keys
- Composite keys
- Referential integrity
- Database constraints
- SQL views
- Stored procedures
- Database user privileges
- Data validation and querying

## Author

**Yousof Flaifel**

Data Science & AI Student  
Al Hussein Technical University (HTU)

---

University Database Design and Development Project
