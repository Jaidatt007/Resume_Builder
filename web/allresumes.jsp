<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Resume Dashboard</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f5f7fa;
            margin: 0;
            padding: 20px;
            color: #333;
        }
        
        .container {
            max-width: 1000px;
            margin: 0 auto;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            padding: 25px;
        }
        
        h1 {
            color: #2c3e50;
            margin-bottom: 25px;
            text-align: center;
            font-weight: 600;
        }
        
        .resume-table {
            width: 100%;
            border-collapse: collapse;
            border-radius: 6px;
            overflow: hidden;
        }
        
        .resume-table th {
            background-color: #3498db;
            color: white;
            text-align: left;
            padding: 15px;
            font-weight: 500;
        }
        
        .resume-table td {
            padding: 12px 15px;
            border-bottom: 1px solid #e1e5e9;
        }
        
        .resume-table tr:last-child td {
            border-bottom: none;
        }
        
        .resume-table tr:hover {
            background-color: #f1f5f9;
        }
        
        .view-btn {
            display: inline-block;
            background-color: #3498db;
            color: white;
            text-decoration: none;
            padding: 8px 15px;
            border-radius: 4px;
            transition: all 0.3s ease;
        }
        
        .view-btn:hover {
            background-color: #2980b9;
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        
        .status-badge {
            display: inline-block;
            border-radius: 12px;
            padding: 4px 12px;
            font-size: 12px;
            font-weight: 500;
        }
        
        .empty-message {
            text-align: center;
            padding: 40px;
            color: #7f8c8d;
            font-style: italic;
        }
        
        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }
        
        .add-resume {
            background-color: #2ecc71;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 4px;
            text-decoration: none;
            transition: all 0.3s ease;
        }
        
        .add-resume:hover {
            background-color: #27ae60;
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>Resume Dashboard</h1>
            <a href="javascript:history.back()" class="add-resume">+ Add New Resume</a>
        </div>
        
        <table class="resume-table">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
            <%
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/resume_builder", "root", "0007");
                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery("SELECT * FROM resumes");
                boolean hasData = false;
                
                while (rs.next()) {
                    hasData = true;
            %>
                <tr>
                    <td><%= rs.getInt("id") %></td>
                    <td><%= rs.getString("name") %></td>
                    <td><%= rs.getString("email") %></td>
                    <td>
                        <a href="viewResume?id=<%= rs.getInt("id") %>" class="view-btn">View</a>
                    </td>
                </tr>
            <% } 
               
               if (!hasData) {
            %>
                <tr>
                    <td colspan="4" class="empty-message">No resumes found. Click 'Add New Resume' to get started!</td>
                </tr>
            <% } %>
            </tbody>
        </table>
    </div>