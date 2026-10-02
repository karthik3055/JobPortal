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

        String mySkills = (String) request.getSession().getAttribute("skills");

        if (mySkills == null || mySkills.trim().isEmpty()) {
            response.sendRedirect("login.jsp");
            return;
        }

        ArrayList<Job> jobs = new ArrayList<>();
        String sql = "SELECT id, title, company, skills FROM jobs";

        try (
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery()
        ) {
            String[] my = mySkills.toLowerCase().split(",");

            while (rs.next()) {
                Job job = new Job();

                job.setId(rs.getInt("id"));
                job.setTitle(rs.getString("title"));
                job.setCompany(rs.getString("company"));
                job.setSkills(rs.getString("skills"));

                String[] required = job.getSkills().toLowerCase().split(",");
                int match = 0;

                for (String requiredSkill : required) {
                    for (String mySkill : my) {
                        if (requiredSkill.trim().equals(mySkill.trim())) {
                            match++;
                            break;
                        }
                    }
                }

                int percentage = required.length == 0
                    ? 0
                    : match * 100 / required.length;

                job.setMatch(percentage);
                jobs.add(job);
            }

            request.setAttribute("jobs", jobs);
            request.getRequestDispatcher("jobs.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }
}