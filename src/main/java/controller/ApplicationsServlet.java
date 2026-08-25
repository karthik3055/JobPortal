package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import dao.DBConnection;

@WebServlet("/applications")
public class ApplicationsServlet extends HttpServlet {

    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        try {

            Connection con =
                DBConnection.getConnection();

            String sql =
                "SELECT users.name, users.email, "
                + "jobs.title, jobs.company, "
                + "applications.applied_date "
                + "FROM applications "
                + "JOIN users ON applications.user_id = users.id "
                + "JOIN jobs ON applications.job_id = jobs.id";

            PreparedStatement ps =
                con.prepareStatement(sql);

            ResultSet rs =
                ps.executeQuery();

            request.setAttribute(
                "result",
                rs
            );

            request.getRequestDispatcher(
                "applications.jsp"
            ).forward(request, response);

        } catch (Exception e) {

            e.printStackTrace();
        }
    }
}