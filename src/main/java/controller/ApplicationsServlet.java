package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import dao.DBConnection;
import model.Application;

@WebServlet("/applications")
public class ApplicationsServlet extends HttpServlet {

    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String sql = "SELECT users.name, users.email, jobs.title, jobs.company, "
                   + "applications.applied_date "
                   + "FROM applications "
                   + "JOIN users ON applications.user_id = users.id "
                   + "JOIN jobs ON applications.job_id = jobs.id "
                   + "ORDER BY applications.applied_date DESC";

        List<Application> applications = new ArrayList<>();

        try (
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery()
        ) {
            while (rs.next()) {
                applications.add(new Application(
                    rs.getString("name"),
                    rs.getString("email"),
                    rs.getString("title"),
                    rs.getString("company"),
                    rs.getString("applied_date")
                ));
            }

            request.setAttribute("applications", applications);
            request.getRequestDispatcher("applications.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }
}