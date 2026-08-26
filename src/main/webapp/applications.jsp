<%@ page import="java.sql.ResultSet" %>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Applications - JobPortal</title>

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

        /* NAVBAR */

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
            color: #333;

            text-decoration: none;

            font-weight: bold;
        }

        nav a:hover {
            color: #4f46e5;
        }

        /* CONTAINER */

        .container {
            width: 92%;

            max-width: 1100px;

            margin: 45px auto;

            background: white;

            padding: 30px;

            border-radius: 12px;

            box-shadow: 0 5px 20px #ddd;
        }

        h1 {
            text-align: center;

            color: #4f46e5;

            margin-top: 0;
        }

        .subtitle {
            text-align: center;

            color: #64748b;

            margin-bottom: 25px;
        }

        /* TABLE */

        .table-box {
            overflow-x: auto;
        }

        table {
            width: 100%;

            min-width: 650px;

            border-collapse: collapse;
        }

        th {
            background: #4f46e5;

            color: white;

            padding: 13px;
        }

        td {
            padding: 13px;

            text-align: center;

            border-bottom: 1px solid #ddd;
        }

        tr:hover {
            background: #f5f7ff;
        }

        /* MESSAGE */

        .message {
            text-align: center;

            padding: 30px;

            color: #64748b;
        }

        /* BUTTON */

        .back {
            display: inline-block;

            margin-top: 20px;

            padding: 11px 20px;

            background: #4f46e5;

            color: white;

            text-decoration: none;

            border-radius: 7px;

            font-weight: bold;
        }

        .back:hover {
            background: #3730a3;
        }

        /* MOBILE */

        @media (max-width: 600px) {

            nav {
                padding: 15px 20px;
            }

            .logo {
                font-size: 20px;
            }

            .container {
                width: 94%;

                padding: 20px;

                margin: 30px auto;
            }

            h1 {
                font-size: 28px;
            }

        }

    </style>

</head>


<body>


<!-- NAVBAR -->

<nav>

    <a href="index.html" class="logo">
        JobPortal
    </a>

    <a href="index.html">
        Home
    </a>

</nav>


<!-- CONTENT -->

<div class="container">

    <h1>
        Job Applications
    </h1>

    <p class="subtitle">
        View submitted candidate applications
    </p>


<%

ResultSet rs =
    (ResultSet) request.getAttribute("result");

if (rs != null) {

%>


    <div class="table-box">

        <table>

            <tr>

                <th>
                    Candidate
                </th>

                <th>
                    Email
                </th>

                <th>
                    Job
                </th>

                <th>
                    Company
                </th>

                <th>
                    Applied Date
                </th>

            </tr>


<%

    boolean found = false;

    while (rs.next()) {

        found = true;

%>


            <tr>

                <td>
                    <%= rs.getString("name") %>
                </td>

                <td>
                    <%= rs.getString("email") %>
                </td>

                <td>
                    <%= rs.getString("title") %>
                </td>

                <td>
                    <%= rs.getString("company") %>
                </td>

                <td>
                    <%= rs.getString("applied_date") %>
                </td>

            </tr>


<%

    }

%>

        </table>

    </div>


<%

    if (!found) {

%>

        <div class="message">

            <h3>
                No applications yet
            </h3>

            <p>
                No candidates have applied for jobs.
            </p>

        </div>

<%

    }

} else {

%>


    <div class="message">

        <h3>
            No application data
        </h3>

        <p>
            No application information is available.
        </p>

    </div>


<%

}

%>


    <a href="index.html" class="back">
        Back to Home
    </a>


</div>

</body>

</html>