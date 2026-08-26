<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Login Failed - JobPortal</title>

    <style>

        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background: #f5f7ff;
        }

        .box {
            width: 90%;
            max-width: 450px;

            margin: 100px auto;

            padding: 35px;

            background: white;

            border-radius: 12px;

            box-shadow: 0 5px 20px #ddd;

            text-align: center;
        }

        h1 {
            color: #dc2626;
        }

        p {
            color: #64748b;
        }

        a {
            display: inline-block;

            margin: 8px;

            padding: 11px 20px;

            background: #4f46e5;

            color: white;

            text-decoration: none;

            border-radius: 7px;

            font-weight: bold;
        }

        a:hover {
            background: #3730a3;
        }

        @media (max-width: 500px) {

            .box {
                margin: 60px auto;
                padding: 25px;
            }

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

    <a href="login.jsp">
        Try Again
    </a>

    <a href="register.jsp">
        Register
    </a>

</div>

</body>
</html>