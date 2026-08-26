<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Register - JobPortal</title>

    <style>

        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background: #f5f7ff;
            color: #222;
        }

        nav {
            background: white;
            padding: 15px 6%;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 2px 8px #ddd;
        }

        .logo {
            color: #4f46e5;
            font-size: 24px;
            font-weight: bold;
            text-decoration: none;
        }

        nav a {
            text-decoration: none;
            color: #333;
            font-weight: bold;
        }

        .box {
            width: 90%;
            max-width: 420px;
            margin: 50px auto;
            padding: 30px;
            background: white;
            border-radius: 12px;
            box-shadow: 0 5px 20px #ddd;
        }

        h2 {
            text-align: center;
            color: #4f46e5;
        }

        label {
            display: block;
            margin-top: 13px;
            margin-bottom: 5px;
            font-weight: bold;
        }

        input {
            width: 100%;
            padding: 11px;
            border: 1px solid #ccc;
            border-radius: 7px;
        }

        input[type="submit"] {
            margin-top: 20px;
            background: #4f46e5;
            color: white;
            border: none;
            font-weight: bold;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background: #3730a3;
        }

        p {
            text-align: center;
            color: #64748b;
        }

        p a {
            color: #4f46e5;
            font-weight: bold;
        }

    </style>

</head>

<body>

<nav>

    <a href="index.html" class="logo">
        JobPortal
    </a>

    <a href="index.html">
        Home
    </a>

</nav>


<div class="box">

    <h2>Create Account</h2>

    <form action="register" method="post">

        <label>Name</label>

        <input
            type="text"
            name="name"
            required>


        <label>Email</label>

        <input
            type="email"
            name="email"
            required>


        <label>Password</label>

        <input
            type="password"
            name="password"
            required>


        <label>Skills</label>

        <input
            type="text"
            name="skills"
            placeholder="Java, SQL, HTML"
            required>


        <input
            type="submit"
            value="Register">

    </form>


    <p>
        Already registered?
        <a href="login.jsp">Login</a>
    </p>

</div>

</body>
</html>