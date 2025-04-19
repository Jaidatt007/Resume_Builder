<%@ page import="java.sql.ResultSet" %>
<%
    ResultSet resume = (ResultSet) request.getAttribute("resume");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><%= resume.getString("name") %> Resume</title>
    <style>
    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        margin: 0;
        padding: 0;
        display: flex;
        background-color: #f5f7fa;
        color: #333;
    }

    .sidebar {
        background-color: #3498db;
        color: white;
        width: 32%;
        padding: 20px;
        box-sizing: border-box;
        height: 100vh;
    }

    .main-content {
        flex: 1;
        padding: 20px;
        background-color: white;
    }

    .id-card {
        background-color: #2980b9;
        padding: 15px;
        border-radius: 5px;
        margin-bottom: 20px;
    }

    .id-number {
        font-size: 14px;
        margin-bottom: 10px;
    }

    .name {
        font-size: 24px;
        font-weight: bold;
        margin: 0;
    }

    .contact-section {
        background-color: #2980b9;
        padding: 15px;
        border-radius: 5px;
    }

    .contact-header {
        font-size: 18px;
        font-weight: bold;
        text-align: center;
        margin-bottom: 15px;
    }

    .contact-info {
        margin-bottom: 10px;
    }

    .contact-label {
        display: block;
        margin-bottom: 5px;
    }

    .contact-value {
        display: block;
        margin-bottom: 15px;
        font-style: italic;
    }

    .section-header {
        background-color: #3498db;
        color: white;
        padding: 15px;
        font-size: 22px;
        font-weight: bold;
        margin-bottom: 10px;
        border-radius: 5px;
    }

    .section-content {
        background-color: #ecf4fb;
        padding: 20px;
        margin-bottom: 20px;
        border-radius: 5px;
    }

    .education-row {
        display: flex;
        justify-content: space-between;
        margin-bottom: 10px;
    }

    .education-label {
        font-weight: bold;
    }

    .project-title {
        font-weight: bold;
        font-size: 18px;
        margin-bottom: 10px;
    }

    .project-description {
        line-height: 1.5;
    }
</style>
</head>
<body>
    <div class="sidebar">
        <div class="id-card">
            <div class="id-number">ID: <%= resume.getString("id") %></div>
            <h1 class="name"><%= resume.getString("name").toUpperCase() %></h1>
        </div>

        <div class="contact-section">
            <div class="contact-header">CONTACT</div>
            <div class="contact-info">
                <span class="contact-label">Email:</span>
                <span class="contact-value"><%= resume.getString("email") %></span>

                <span class="contact-label">Phone:</span>
                <span class="contact-value"><%= resume.getString("phone") %></span>

                <span class="contact-label">LinkedIn:</span>
                <span class="contact-value"><a href="<%= resume.getString("linkedin") %>"><%= resume.getString("linkedin") %></a></span>

                <span class="contact-label">GitHub:</span>
                <span class="contact-value"><a href="<%= resume.getString("github") %>"><%= resume.getString("github") %></a></span>
            </div>
        </div>
    </div>

    <div class="main-content">
        <div class="section-header">DOMAIN</div>
        <div class="section-content">
            <div style="padding: 10px;"><%= resume.getString("domain") %></div>
        </div>

        <div class="section-header">EDUCATION</div>
        <div class="section-content">
            <div class="education-row">
                <div class="education-label">HSC Score:</div>
                <div><%= resume.getString("hsc_score") %></div>
            </div>
            <div class="education-row">
                <div class="education-label">Graduation Score:</div>
                <div><%= resume.getString("grad_score") %></div>
            </div>
        </div>

        <div class="section-header">SKILLS</div>
        <div class="section-content">
            <div style="padding: 10px;"><%= resume.getString("skills") %></div>
        </div>

        <div class="section-header">PROJECT</div>
        <div class="section-content">
            <div class="project-title"><%= resume.getString("projects") %></div>
            <div class="project-description">
                <p><%= resume.getString("proj_desc") %></p>
            </div>
        </div>
    </div>
</body>
</html>
