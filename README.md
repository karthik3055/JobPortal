# Job Portal

A Java web application that allows users to register, log in, view job listings, and find jobs based on their skills.

## Features

- User registration
- User login
- User skill storage
- Job listing
- Skill-based job matching
- Job application handling
- Application viewing
- MySQL database connectivity

## Technology Stack

- Java 17
- Jakarta Servlet 6
- JDBC
- MySQL
- JSP
- HTML
- CSS
- Maven
- WAR packaging

## Project Structure

```text
JobPortal/
├── src/
│   └── main/
│       ├── java/
│       │   ├── controller/
│       │   ├── dao/
│       │   └── model/
│       └── webapp/
├── pom.xml
└── Dockerfile
```

## Main Components

### Controllers

- `RegisterServlet` handles user registration.
- `LoginServlet` handles user login.
- `JobServlet` loads jobs and calculates skill match percentage.
- `ApplyServlet` handles job applications.
- `ApplicationsServlet` displays submitted applications.

### Database

The application uses MySQL through JDBC.

Database connection values are read from environment variables:

```text
DB_HOST
DB_PORT
DB_NAME
DB_USER
DB_PASSWORD
```

Do not place database passwords directly in the source code.

## Skill Matching

The job matching logic compares the skills stored for the logged-in user with the skills required by each job.

For each job, the application calculates:

```text
matched skills / required skills × 100
```

The resulting percentage is displayed with the job information.

## Running the Project

### 1. Configure MySQL

Create the required database and tables used by the application.

The application expects the database connection values to be available as environment variables.

### 2. Configure the environment

Example:

```text
DB_HOST=localhost
DB_PORT=3306
DB_NAME=jobportal
DB_USER=root
DB_PASSWORD=your_password
```

Use your own MySQL credentials.

### 3. Build

Run:

```bash
mvn clean package
```

This creates:

```text
target/JobPortal.war
```

### 4. Deploy

Deploy the WAR file to a Jakarta Servlet 6 compatible application server.

## Current Scope

The repository currently uses Servlets, JSP, JDBC, and MySQL. Spring Boot and React are not part of the current implementation.

Future development can move the application toward a Spring Boot REST backend and React frontend while keeping the existing job-portal functionality.

## Focus

**Java · JDBC · MySQL · JSP · Jakarta Servlet · Maven · Web Application**
