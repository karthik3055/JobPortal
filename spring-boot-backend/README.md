# Job Portal Spring Boot Backend

REST API backend for the Job Portal full-stack application.

## About

This module provides the server-side application layer for user authentication, job matching, and job applications. It uses Spring Boot and Spring Data JPA to communicate with the MySQL database.

## Stack

- Java 17
- Spring Boot
- Spring Web
- Spring Data JPA
- MySQL
- Maven

## API Endpoints

| Method | Endpoint | Purpose |
|---|---|---|
| POST | `/api/auth/register` | Register a new user |
| POST | `/api/auth/login` | Log in a user |
| GET | `/api/jobs?userId=1` | Get jobs with skill match |
| POST | `/api/applications?userId=1&jobId=1` | Submit an application |
| GET | `/api/applications` | Get application records |

## Structure

```text
spring-boot-backend/
├── src/main/java/com/jobportal/
│   ├── controller/
│   ├── dto/
│   ├── model/
│   └── repository/
├── src/main/resources/
│   └── application.properties
├── pom.xml
└── README.md
```

## Database

The backend uses the `jobportal` MySQL database created by:

`../sql/jobportal.sql`

JPA is configured with `ddl-auto=none`, so the existing SQL schema is used instead of having Hibernate create the tables.

## Run

Make sure MySQL is running and the `jobportal` database has been created.

From this directory:

```bash
mvn spring-boot:run
```

The API starts at:

`http://localhost:8080`

## Configuration

Database settings are in:

`src/main/resources/application.properties`

Update the MySQL username and password for your local environment.

## Project Focus

**Java · Spring Boot · REST API · Spring Data JPA · MySQL**
