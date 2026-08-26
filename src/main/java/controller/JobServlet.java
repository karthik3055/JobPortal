package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import dao.DBConnection;
import model.Job;

@WebServlet("/findJobs")
public class JobServlet extends HttpServlet {

    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String mySkills =
            (String) request.getSession()
                .getAttribute("skills");

        // If skills are missing
        if (mySkills == null || mySkills.trim().isEmpty()) {

            response.sendRedirect("login.jsp");
            return;
        }

        ArrayList<Job> jobs =
            new ArrayList<Job>();

        try {

            Connection con =
                DBConnection.getConnection();

            PreparedStatement ps =
                con.prepareStatement(
                    "SELECT * FROM jobs"
                );

            ResultSet rs =
                ps.executeQuery();

            while (rs.next()) {

                Job job = new Job();

                job.setId(
                    rs.getInt("id")
                );

                job.setTitle(
                    rs.getString("title")
                );

                job.setCompany(
                    rs.getString("company")
                );

                job.setSkills(
                    rs.getString("skills")
                );


                int match = 0;

                String[] my =
                    mySkills.toLowerCase().split(",");

                String[] required =
                    job.getSkills()
                       .toLowerCase()
                       .split(",");


                for (String r : required) {

                    for (String m : my) {

                        if (r.trim().equals(m.trim())) {

                            match++;

                            break;
                        }
                    }
                }


                int percentage = 0;

                if (required.length > 0) {

                    percentage =
                        match * 100 / required.length;
                }

                job.setMatch(percentage);

                jobs.add(job);
            }


            request.setAttribute(
                "jobs",
                jobs
            );


            request.getRequestDispatcher(
                "jobs.jsp"
            ).forward(
                request,
                response
            );


        } catch (Exception e) {

            e.printStackTrace();

            response.sendRedirect(
                "error.jsp"
            );
        }
    }
}