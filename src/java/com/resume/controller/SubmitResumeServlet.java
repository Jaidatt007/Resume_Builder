package com.resume.controller;

import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.sql.*;

public class SubmitResumeServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String domain = request.getParameter("domain");
        String linkedin = request.getParameter("linkedin");
        String github = request.getParameter("github");
        String hsc = request.getParameter("hsc");
        String grad = request.getParameter("grad");
        String project = request.getParameter("project");
        String projDesc = request.getParameter("projDesc");
        String skill = request.getParameter("skill");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/resume_builder", "root", "0007");

            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO resumes(name,email,phone,domain,linkedin,github,hsc_score,grad_score,projects,skills,proj_desc) VALUES(?,?,?,?,?,?,?,?,?,?,?)");

            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, phone);
            ps.setString(4, domain);
            ps.setString(5, linkedin);
            ps.setString(6, github);
            ps.setString(7, hsc);
            ps.setString(8, grad);
            ps.setString(9, project);
            ps.setString(10, skill);
            ps.setString(11, projDesc);

            ps.executeUpdate();

            response.sendRedirect("allresumes.jsp");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
