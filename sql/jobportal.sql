CREATE DATABASE IF NOT EXISTS jobportal;
USE jobportal;

CREATE TABLE IF NOT EXISTS users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    skills VARCHAR(500)
);

CREATE TABLE IF NOT EXISTS jobs (
    id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(150) NOT NULL,
    company VARCHAR(150) NOT NULL,
    skills VARCHAR(500) NOT NULL
);

CREATE TABLE IF NOT EXISTS applications (
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    job_id INT NOT NULL,
    applied_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (job_id) REFERENCES jobs(id)
);

INSERT INTO users (name, email, password, skills)
SELECT 'Karthik', 'karthik@example.com', 'karthik123', 'Java,Spring Boot,SQL,HTML,CSS'
WHERE NOT EXISTS (
    SELECT 1 FROM users WHERE email = 'karthik@example.com'
);

INSERT INTO jobs (title, company, skills)
SELECT 'Java Developer', 'TechNova Solutions', 'Java,Spring Boot,SQL'
WHERE NOT EXISTS (
    SELECT 1 FROM jobs WHERE title = 'Java Developer' AND company = 'TechNova Solutions'
);

INSERT INTO jobs (title, company, skills)
SELECT 'Full Stack Developer', 'CodeBridge Technologies', 'Java,React,JavaScript,SQL'
WHERE NOT EXISTS (
    SELECT 1 FROM jobs WHERE title = 'Full Stack Developer' AND company = 'CodeBridge Technologies'
);

INSERT INTO jobs (title, company, skills)
SELECT 'Backend Developer', 'DataCore Systems', 'Java,Spring Boot,JDBC,MySQL'
WHERE NOT EXISTS (
    SELECT 1 FROM jobs WHERE title = 'Backend Developer' AND company = 'DataCore Systems'
);

INSERT INTO jobs (title, company, skills)
SELECT 'Frontend Developer', 'PixelWorks', 'HTML,CSS,JavaScript,React'
WHERE NOT EXISTS (
    SELECT 1 FROM jobs WHERE title = 'Frontend Developer' AND company = 'PixelWorks'
);

INSERT INTO jobs (title, company, skills)
SELECT 'Software Engineer', 'Innovate Labs', 'Java,Python,SQL,Git'
WHERE NOT EXISTS (
    SELECT 1 FROM jobs WHERE title = 'Software Engineer' AND company = 'Innovate Labs'
);

INSERT INTO jobs (title, company, skills)
SELECT 'Junior Java Developer', 'AppSphere', 'Java,SQL,Git,REST APIs'
WHERE NOT EXISTS (
    SELECT 1 FROM jobs WHERE title = 'Junior Java Developer' AND company = 'AppSphere'
);

SELECT * FROM users;
SELECT * FROM jobs;
SELECT * FROM applications;
