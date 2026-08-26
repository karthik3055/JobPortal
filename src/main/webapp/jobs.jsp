<%@ page import="java.util.ArrayList" %>
<%@ page import="model.Job" %>

<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Jobs - JobPortal</title>

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
            color: #333;
            text-decoration: none;
            font-weight: bold;
        }

        .container {
            width: 90%;
            max-width: 1100px;
            margin: 45px auto;
        }

        h1 {
            text-align: center;
            color: #4f46e5;
        }

        .subtitle {
            text-align: center;
            color: #64748b;
        }

        .jobs {
            display: grid;
            grid-template-columns:
                repeat(auto-fit, minmax(280px, 1fr));
            gap: 20px;
            margin-top: 30px;
        }

        .job-card {
            background: white;
            padding: 25px;
            border-radius: 12px;
            box-shadow: 0 5px 20px #ddd;
        }

        .job-card h2 {
            color: #4f46e5;
            margin-top: 0;
        }

        .company {
            font-weight: bold;
            color: #555;
        }

        .skills {
            margin-top: 15px;
            padding: 12px;
            background: #f1f3ff;
            border-radius: 8px;
            color: #555;
        }

        .match {
            margin-top: 15px;
            padding: 9px;
            text-align: center;
            border-radius: 7px;
            font-weight: bold;
        }

        .high {
            background: #dcfce7;
            color: #15803d;
        }

        .medium {
            background: #fef3c7;
            color: #b45309;
        }

        .low {
            background: #fee2e2;
            color: #dc2626;
        }

        .apply {
            width: 100%;
            margin-top: 15px;
            padding: 11px;
            background: #4f46e5;
            color: white;
            border: none;
            border-radius: 7px;
            font-weight: bold;
            cursor: pointer;
        }

        .apply:hover {
            background: #3730a3;
        }

        .no-jobs {
            background: white;
            padding: 30px;
            text-align: center;
            border-radius: 12px;
        }

        footer {
            margin-top: 50px;
            background: #172033;
            color: white;
            text-align: center;
            padding: 20px;
        }

        @media (max-width: 600px) {

            .container {
                width: 92%;
            }

            h1 {
                font-size: 30px;
            }

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


<div class="container">

    <h1>Recommended Jobs</h1>

    <p class="subtitle">
        Jobs matched according to your skills
    </p>


    <div class="jobs">

<%

ArrayList<Job> jobs =
    (ArrayList<Job>) request.getAttribute("jobs");

if (jobs != null && !jobs.isEmpty()) {

    for (Job job : jobs) {

        int match = job.getMatch();

        String matchClass = "low";

        if (match >= 70) {
            matchClass = "high";
        }
        else if (match >= 40) {
            matchClass = "medium";
        }

%>

        <div class="job-card">

            <h2>
                <%= job.getTitle() %>
            </h2>

            <div class="company">
                <%= job.getCompany() %>
            </div>

            <div class="skills">

                <strong>Skills:</strong>

                <%= job.getSkills() %>

            </div>

            <div class="match <%= matchClass %>">

                Match:
                <%= match %>%

            </div>


            <form action="apply" method="post">

                <input
                    type="hidden"
                    name="jobId"
                    value="<%= job.getId() %>">

                <button
                    type="submit"
                    class="apply">

                    Apply Now

                </button>

            </form>

        </div>

<%

    }

} else {

%>

        <div class="no-jobs">

            <h2>No Jobs Found</h2>

            <p>
                No matching jobs are currently available.
            </p>

        </div>

<%

}

%>

    </div>

</div>


<footer>
    Skill Based Job Portal © 2026
</footer>

</body>
</html>