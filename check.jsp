<%@ page language="java" %>
<%@ page import="java.sql.*" %>

<%
    String email = request.getParameter("username");
    String password = request.getParameter("password");
    String domain = email.split("@")[1];
    session.setAttribute("email",email);

    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/skilltracker","root", "");
        Statement stmt = con.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT Email,PWD FROM form_det WHERE Email='"+email+"' AND PWD='"+password+"'");

        if (rs.next()) {
            if (email.equals("admin@gmail.com")) {
                response.sendRedirect("admin.jsp");
            } else if (domain.equals("student.tce.edu")) {
                response.sendRedirect("view.jsp");
            } else if (domain.equals("tce.edu")) {
                response.sendRedirect("put.jsp");
            } else {
                out.println("Invalid email domain");
            }
        } else {
            out.println("Invalid email or password");
        }

        con.close();
    } catch (Exception e) {
        out.println(e);
    }
%>

