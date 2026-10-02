# Job Portal

A full-stack Java job portal that connects a React frontend with a Spring Boot REST API and MySQL database. The repository also preserves the original Servlet/JSP implementation.

## Features

- User registration and login
- Skill-based job matching
- Job listing
- Job applications
- Application history
- REST API
- React web interface
- MySQL database
- Legacy Servlet/JSP implementation

## Architecture

```text
React + Vite
      |
      v
Spring Boot REST API
      |
      v
Spring Data JPA
      |
      v
MySQL
```

The original Java Servlet/JSP application remains available under `src/`.

## Technology Stack

### Modern Full Stack

- Java 17
- Spring Boot
- Spring Web
- Spring Data JPA
- MySQL
- Maven
- React
- Vite
- JavaScript
- CSS

### Original Implementation

- Jakarta Servlet 6
- JDBC
- JSP
- HTML
- CSS
- Maven

## Project Structure

```text
JobPortal/
├── react-frontend/
│   ├── src/
│   ├── package.json
│   └── README.md
├── spring-boot-backend/
│   ├── src/
│   ├── pom.xml
│   └── README.md
├── sql/
│   └── jobportal.sql
├── src/
│   └── main/
│       ├── java/
│       └── webapp/
├── pom.xml
└── README.md
```

## Spring Boot API

| Method | Endpoint | Purpose |
|---|---|---|
| POST | `/api/auth/register` | Register a user |
| POST | `/api/auth/login` | Authenticate a user |
| GET | `/api/jobs?userId=1` | Get jobs with skill match |
| POST | `/api/applications?userId=1&jobId=1` | Apply for a job |
| GET | `/api/applications` | View applications |

## Database

The MySQL schema is available at:

`sql/jobportal.sql`

It creates:

- `users`
- `jobs`
- `applications`

The application table prevents duplicate applications for the same user and job.

## Run the Full-Stack Version

### 1. Create the database

Run `sql/jobportal.sql` in MySQL.

### 2. Start the Spring Boot backend

From `spring-boot-backend/`:

```bash
mvn spring-boot:run
```

The API runs on:

`http://localhost:8080`

### 3. Start the React frontend

From `react-frontend/`:

```bash
npm install
npm run dev
```

The Vite development server runs on:

`http://localhost:5173`

## Database Configuration

The Spring Boot backend currently expects a local MySQL database:

```text
Database: jobportal
Username: root
Password: empty by default
Port: 3306
```

Update `spring-boot-backend/src/main/resources/application.properties` for your local MySQL credentials.

The original Servlet/JSP implementation uses:

```text
DB_HOST
DB_PORT
DB_NAME
DB_USER
DB_PASSWORD
```

## Skill Matching

The application compares a user's stored skills with the skills required by each job.

```text
matched skills / required skills × 100
```

The resulting percentage is returned by the API and displayed in the React interface.

## Project Focus

**Java · Spring Boot · React · REST API · JPA · MySQL · SQL · Full Stack Development**
