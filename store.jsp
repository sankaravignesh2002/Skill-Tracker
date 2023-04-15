<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
String name = request.getParameter("name");
String roll = request.getParameter("roll");
String age = request.getParameter("age");
String dob = request.getParameter("dob");
String pmb = request.getParameter("pmb");
String pass = request.getParameter("password");
String add = request.getParameter("ad");
String email = request.getParameter("email");
String gender= request.getParameter("gender");
String url = "jdbc:mysql://localhost:3306/skilltracker";
String user = "root";
String password = "";
try
{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection(url, user, password);
PreparedStatement stmt = conn.prepareStatement("INSERT INTO  form_det (Name, Roll, Age, DOB ,Mobile, PWD, Address, Email, Gender) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)");
stmt.setString(1, name);
stmt.setString(2, roll);
stmt.setString(3, age);
stmt.setString(4, dob);
stmt.setString(5, pmb);
stmt.setString(6, pass);
stmt.setString(7, add);
stmt.setString(8, email);
stmt.setString(9, gender);
stmt.executeUpdate();
stmt.close();
conn.close();
}
catch(Exception e) 
{
    out.println("Error: " + e.getMessage());
}
%>
<html>
<head>
<title>Thank You</title>
</head>
<body>
<h1>Thank You</h1>
<p>Your information has been submitted.</p>
</body>
</html>