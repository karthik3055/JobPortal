<%@ page import="java.util.ArrayList" %>
<%@ page import="model.Job" %>

<!DOCTYPE html>

<html>

<head>

    <meta charset="UTF-8">

    <title>Recommended Jobs</title>

    <style>

        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background: linear-gradient(135deg, #667eea, #764ba2);
        }

        /* Header */

        .header {
            background: white;
            padding: 20px 50px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .logo {
            font-size: 25px;
            font-weight: bold;
            color: #4f46e5;
        }

        .home {
            text-decoration: none;
            background: #4f46e5;
            color: white;
            padding: 10px 20px;
            border-radius: 6px;
        }

        .home:hover {
            background: #3730a3;
        }

        /* Main */

        .container {
            width: 90%;
            max-width: 1100px;
            margin: 40px auto;
        }

        .title {
            text-align: center;
            color: white;
            margin-bottom: 30px;
        }

        .title h1 {
            font-size: 38px;
        }

        .title p {
            font-size: 18px;
        }

        /* Job Cards */

        .jobs {
            display: grid;
            grid-template-columns:
                repeat(auto-fit, minmax(300px, 1fr));

            gap: 25px;
        }

        .job-card {
            background: white;
            padding: 25px;
            border-radius: 15px;

            box-shadow:
                0 8px 20px rgba(0,0,0,0.2);

            transition: 0.3s;
        }

        .job-card:hover {
            transform: translateY(-8px);

            box-shadow:
                0 15px 30px rgba(0,0,0,0.3);
        }

        .job-card h2 {
            color: #4f46e5;
            margin-top: 0;
        }

        .company {
            color: #666;
            font-size: 17px;
            font-weight: bold;
        }

        .skills {
            background: #f1f5ff;
            padding: 12px;
            border-radius: 8px;
            margin-top: 15px;
            color: #444;
        }

        /* Match */

        .match {
            margin-top: 18px;
            padding: 10px;
            border-radius: 8px;
            text-align: center;
            font-size: 20px;
            font-weight: bold;
        }

        .high {
            background: #d1fae5;
            color: #047857;
        }

        .medium {
            background: #fef3c7;
            color: #b45309;
        }

        .low {
            background: #fee2e2;
            color: #dc2626;
        }

        /* Apply button */

        .apply {
            width: 100%;
            margin-top: 15px;
            padding: 12px;

            background: #4f46e5;
            color: white;

            border: none;
            border-radius: 8px;

            font-size: 16px;
            cursor: pointer;
        }

        .apply:hover {
            background: #3730a3;
        }

        /* No jobs */

        .no-jobs {
            background: white;
            padding: 30px;
            text-align: center;
            border-radius: 10px;
        }

        /* Footer */

        footer {
            background: #222;
            color: white;
            text-align: center;
            padding: 20px;
            margin-top: 40px;
        }

    </style>

</head>


<body>


<!-- Header -->

<div class="header">

    <div class="logo">
        JobPortal
    </div>

    <a href="index.html" class="home">
        Home
    </a>

</div>


<!-- Main -->

<div class="container">


    <div class="title">

        <h1>Recommended Jobs</h1>

        <p>
            Jobs matched according to your skills
        </p>

    </div>


    <div class="jobs">

<%

ArrayList<Job> jobs =
    (ArrayList<Job>) request.getAttribute("jobs");

if (jobs != null && !jobs.isEmpty()) {

    for(Job job : jobs) {

        int match = job.getMatch();

        String matchClass = "low";

        if(match >= 70) {
            matchClass = "high";
        }
        else if(match >= 40) {
            matchClass = "medium";
        }

%>


        <!-- Job Card -->

        <div class="job-card">

            <h2>
                <%= job.getTitle() %>
            </h2>

            <div class="company">
                <%= job.getCompany() %>
            </div>

            <div class="skills">

                <strong>
                    Required Skills
                </strong>

                <br><br>

                <%= job.getSkills() %>

            </div>


            <div class="match <%= matchClass %>">

                Match:
                <%= match %>%

            </div>


    <form action="apply" method="post">

    <input type="hidden"
           name="jobId"
           value="<%= job.getId() %>">

    <button type="submit"
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

    Skill Based Job Portal

</footer>


<script>

function applyJob(jobName) {

    alert(
        "Application started for " + jobName
    );

}

</script>


</body>

</html>