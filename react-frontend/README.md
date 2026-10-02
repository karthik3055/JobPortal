# Job Portal React Frontend

React frontend for the Job Portal Spring Boot REST API.

## About

This module provides the user interface for registration, login, job discovery, skill matching, job applications, and application history. It communicates with the Spring Boot backend using the browser Fetch API.

## Stack

- React
- Vite
- JavaScript
- CSS

No additional state-management or HTTP library is required.

## Features

- User registration
- User login
- Skill-based job matching
- Job listing
- Job applications
- Application history
- Logout
- Local session persistence
- Responsive interface

## API Integration

The frontend communicates with:

`http://localhost:8080/api`

Main API calls:

```text
POST /auth/register
POST /auth/login
GET  /jobs?userId=1
POST /applications?userId=1&jobId=1
GET  /applications
```

## Structure

```text
react-frontend/
├── src/
│   ├── App.jsx
│   ├── api.js
│   ├── main.jsx
│   └── styles.css
├── index.html
├── package.json
├── vite.config.js
└── README.md
```

## Run

Make sure the Spring Boot backend is running on port 8080.

Install dependencies:

```bash
npm install
```

Start the development server:

```bash
npm run dev
```

Open:

`http://localhost:5173`

## Project Focus

**React · JavaScript · Vite · REST API · Full Stack Development**
