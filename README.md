# hc_db — BE8093 Introduction to Database Management Systems

Coursework from **BE8093: Introduction to Database Management Systems** at the **University of Cincinnati**.

Original repository: https://github.com/bioinformike/hc_db

## Course overview

University of Cincinnati describes BE8093 as a hands-on database course covering both relational and non-relational database systems, with an emphasis on practical biomedical applications. Public UC course descriptions specifically reference SQL, relational databases, CouchDB/NoSQL, R-based database interaction, and analysis of biomedical data.

That description closely matches the work preserved here: the repository starts with SQL against a healthcare database, moves into CouchDB and REST operations, and finishes with an interactive VAERS data application backed by SQLite.

## What this repository covers

### Relational databases and SQL

The first homework uses **SQLite through RSQLite** and a clinical/patient-encounter dataset.

Exercises cover:

- `SELECT`, `WHERE`, `DISTINCT`, and `LIKE`
- Sorting with `ORDER BY`
- Aggregation with `GROUP BY` and `HAVING`
- Inner and left joins
- Null/missing-record detection
- Nested queries and subqueries
- Patient, encounter, diagnosis, medication, and social-history tables
- Database views and computed summaries

### NoSQL and CouchDB

A second assignment interacts with a CouchDB patient-encounter database from R.

It demonstrates:

- JSON and HTTP/REST concepts
- Reading database metadata
- Creating documents
- Reading documents by ID
- Updating fields
- Removing fields
- Deleting documents
- Querying records using CouchDB's `_find` endpoint
- R interfaces through `R4CouchDB`, `RJSONIO`, and `httr`

### VAERS database application

The course project uses publicly available **Vaccine Adverse Event Reporting System (VAERS)** data and connects an SQLite database to an R Shiny dashboard.

The application includes:

- SQL joins and grouped queries
- Shiny dashboard navigation
- Plotly interactivity
- U.S. state-level mapping
- Time trends
- Age/sex demographic visualization
- Manufacturer and vaccine summaries
- Reactive filtering by year

## Repository structure

```text
hc_db/
├── hw1/
├── hw2/
├── project/
│   └── vaers/
└── README.md
```

## Main tools

- SQL
- SQLite
- DBI / RSQLite
- CouchDB
- JSON / REST
- R
- `httr`
- R Shiny
- `shinydashboard`
- `plotly`
- `ggplot2`
- `dplyr`

## Historical note

This repository contains historical coursework and examples that reference services and endpoints used during the class. Old database hosts, credentials, or API endpoints embedded in assignment code should be treated as obsolete and should not be reused. The VAERS project is an exploratory visualization of reports in VAERS; VAERS reports alone do not establish that a vaccine caused an adverse event.

## Course sources

University of Cincinnati course description for **BE8093 — Introduction to Database Management Systems**:

https://med.uc.edu/docs/default-source/environmental-health-docs/division-of-epidemiology/student-resources/handbooks/epid-handbook-2020-2021_final.pdf?sfvrsn=8eeb3501_0

University of Cincinnati later syllabus for **BE/PH8093 — Introduction to Database Systems and Applications** (Fall 2021):

https://www.med.uc.edu/docs/default-source/undergrad-medical-sciences-docs/intro_to_database_systems_and_applications_22fs_v1.pdf?sfvrsn=5f98da62_0
