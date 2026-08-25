package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import dao.DBConnection;

@WebServlet("/apply")
public class ApplyServlet extends HttpServlet {

    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        int userId =
            (int) session.getAttribute("userId");

        int jobId =
            Integer.parseInt(
                request.getParameter("jobId")
            );

        try {

            Connection con =
                DBConnection.getConnection();

            String sql =
                "INSERT INTO applications(user_id,job_id) "
                + "VALUES(?,?)";

            PreparedStatement ps =
                con.prepareStatement(sql);

            ps.setInt(1, userId);
            ps.setInt(2, jobId);

            ps.executeUpdate();

            response.sendRedirect("success.jsp");

        } catch (Exception e) {

            e.printStackTrace();
        }
    }
}