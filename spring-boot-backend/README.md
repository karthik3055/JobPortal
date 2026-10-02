# Job Portal Spring Boot Backend

REST API version of the existing Job Portal application.

## Stack

Java 17, Spring Boot, Spring Web, Spring Data JPA, MySQL, Maven

## Endpoints

POST /api/auth/register
POST /api/auth/login
GET /api/jobs?userId=1
POST /api/applications?userId=1&jobId=1
GET /api/applications

The existing Servlet/JSP application remains in the repository while this backend is developed.
