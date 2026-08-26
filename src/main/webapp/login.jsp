<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Login - JobPortal</title>

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
            max-width: 400px;
            margin: 70px auto;
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
            margin-top: 15px;
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

    <h2>Candidate Login</h2>

    <form action="login" method="post">

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


        <input
            type="submit"
            value="Login">

    </form>


    <p>
        New candidate?
        <a href="register.jsp">Register</a>
    </p>

</div>

</body>
</html>