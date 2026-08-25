<!DOCTYPE html>
<html>

<head>

    <title>Login</title>

    <style>

        body {
            font-family: Arial;
			background: linear-gradient(135deg, #43cea2, #185a9d);
        }

        .box {
            width: 400px;
            margin: 100px auto;
            padding: 30px;
            background: white;
            border-radius: 15px;
            box-shadow: 0 10px 25px #555;
        }

        h2 {
            text-align: center;
            color: #4f46e5;
        }

        input {
            width: 95%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 6px;
        }

        input[type="submit"] {
            width: 100%;
            background: #4f46e5;
            color: white;
            border: none;
            cursor: pointer;
            font-size: 16px;
        }

        input[type="submit"]:hover {
            background:darkblue;
        }

    </style>

</head>

<body>

<div class="box">

    <h2>Candidate Login</h2>

    <form action="login" method="post">

        Email:
        <input type="email" name="email" required>

        Password:
        <input type="password" name="password" required>

        <input type="submit" value="Login">

    </form>

    <p style="text-align:center;">
        New candidate?
        <a href="register.jsp">Register</a>
    </p>

</div>

</body>

</html>