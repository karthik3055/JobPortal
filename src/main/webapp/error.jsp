<!DOCTYPE html>

<html>

<head>

    <meta charset="UTF-8">

    <title>Login Error</title>

    <style>

        body {
            margin: 0;
            font-family: Arial;
            background: linear-gradient(135deg, #4facfe, #6a5acd);
            text-align: center;
            padding-top: 100px;
        }

        .box {
            width: 450px;
            max-width: 90%;
            margin: auto;
            background: white;
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 10px 25px #555;
        }

        h1 {
            color: red;
        }

        p {
            color: #555;
            font-size: 18px;
        }

        .button {
            display: inline-block;
            padding: 12px 25px;
            margin: 10px;
            color: white;
            background: #4f46e5;
            text-decoration: none;
            border-radius: 7px;
        }

        .button:hover {
            background: #3730a3;
        }

    </style>

</head>

<body>

<div class="box">

    <h1>Login Failed</h1>

    <p>
        Invalid email or password.
    </p>

    <p>
        Please check your details and try again.
    </p>

    <a href="login.jsp" class="button">
        Try Again
    </a>

    <a href="register.jsp" class="button">
        Register
    </a>

</div>

</body>

</html>