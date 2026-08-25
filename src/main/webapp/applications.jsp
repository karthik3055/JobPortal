<%@ page import="java.sql.ResultSet" %>

<!DOCTYPE html>

<html>

<head>

    <meta charset="UTF-8">

    <title>Applications</title>

    <style>

        body {
            font-family: Arial;
            margin: 0;
            background: linear-gradient(135deg, #667eea, #764ba2);
        }

        .container {
            width: 90%;
            max-width: 1000px;
            margin: 50px auto;
            background: white;
            padding: 30px;
            border-radius: 15px;
        }

        h1 {
            text-align: center;
            color: #4f46e5;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 25px;
        }

        th {
            background: #4f46e5;
            color: white;
            padding: 15px;
        }

        td {
            padding: 13px;
            text-align: center;
            border-bottom: 1px solid #ddd;
        }

        tr:hover {
            background: #f1f5ff;
        }

        .back {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 20px;
            background: #4f46e5;
            color: white;
            text-decoration: none;
            border-radius: 6px;
        }

    </style>

</head>

<body>

<div class="container">

    <h1>Job Applications</h1>

    <table>

        <tr>

            <th>Candidate</th>

            <th>Email</th>

            <th>Job</th>

            <th>Company</th>

            <th>Applied Date</th>

        </tr>

<%

ResultSet rs =
    (ResultSet) request.getAttribute("result");

while (rs.next()) {

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

    <a href="index.html" class="back">
        Back to Home
    </a>

</div>

</body>

</html>