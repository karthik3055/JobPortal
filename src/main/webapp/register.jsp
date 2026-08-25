<!DOCTYPE html>
<html>

<head>

    <title>Register</title>

    <style>

        body {
            font-family: Arial;
            background: linear-gradient(135deg, #43cea2, #185a9d);
        }

        .box {
            width: 400px;
            margin: 70px auto;
            padding: 30px;
            background: white;
            border-radius: 15px;
            box-shadow: 0 10px 25px #333;
        }

        h2 {
            text-align: center;
            color: #185a9d;
        }

        input {
            width: 95%;
            padding: 10px;
            margin: 8px 0;
            border: 1px solid #ccc;
            border-radius: 6px;
        }

        input[type="submit"] {
            width: 100%;
            background: #185a9d;
            color: white;
            border: none;
            cursor: pointer;
            font-size: 16px;
        }

        input[type="submit"]:hover {
            background: #43cea2;
        }

    </style>

</head>

<body>

<div class="box">

    <h2> Candidate Registration</h2>

    <form action="register" method="post">

        Name:
        <input type="text" name="name" required>

        Email:
        <input type="email" name="email" required>

        Password:
        <input type="password" name="password" required>

        Skills:
        <input type="text"
               name="skills"
               placeholder="Java,SQL,HTML"
               required>

        <input type="submit" value="Register">

    </form>

    <p style="text-align:center;">
        Already registered?
        <a href="login.jsp">Login</a>
    </p>

</div>

</body>

</html>