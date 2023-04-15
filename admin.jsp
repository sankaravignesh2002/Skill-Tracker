<%@ page import="java.sql.*,java.util.*" %>
<html>
    <head>
        <link rel="icon" type="image/x-icon" href="fav.png">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lobster">
        <style>
            table {
              border-collapse: collapse;
              width: 100%;
              max-width: 800px;
              margin: auto;
            }
            
            th, td {
              text-align: left;
              padding: 8px;
            }
            
            th {
              background-color: #4CAF50;
              color: white;
            }
            
            tr:nth-child(even){background-color: #f2f2f2}
            </style>
    </head>

<%
// Get the connection to the database
// Connect to the database
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/skilltracker", "root", "");

// Get all students from the database
Statement stmt = con.createStatement();
ResultSet rs = stmt.executeQuery("SELECT name, email, mobile FROM form_det WHERE email LIKE '%@student.tce.edu'");



// Build the HTML table
out.println("<body style=\"background-color:black\"><img id=\"im\" src='skill.png' width=\"300\" height=\"50\">");
out.println("<div class=\"w3-right-align\">" +
    "<button class=\"w3-button w3-grey w3-mobile\" onclick=\"window.location.href = 'home.html';\"><b>HOME</b></button>" +
    "<button class=\"w3-button w3-grey w3-mobile\" onclick=\"window.location.href = 'about.html';\"><b>About Us</b></button>" +
    "<button class=\"w3-button w3-grey w3-mobile\" onclick=\"window.location.href = 'contactus.html';\"><b>Contact Us</b></button>" +
    "<button class=\"w3-button w3-grey w3-mobile\" onclick=\"window.location.href = 'ppolicy.html';\"><b>Privacy Policy</b></button>" +
    "<button class=\"w3-button w3-grey w3-mobile\" onclick=\"window.location.href = 'faq.html';\"><b>FAQ</b></button>" +
    "<button class=\"w3-button w3-grey w3-mobile\" onclick=\"window.location.href = 'login.html';\"><b>Admin</b></button>" +
    "</div>");


    out.println("<br><br><br>");
out.println("<h1 style=\"color:#f2f2f2;text-align:center\">Students List</h2>");
out.println("<table>");
out.println("<tr>");
out.println("<th>Name</th>");
out.println("<th>Email</th>");
out.println("<th>Phone</th>");
out.println("</tr>");
while (rs.next()) {
    String name = rs.getString("name");
    String email = rs.getString("email");
    String phone = rs.getString("mobile");

    out.println("<tr>");
    out.println("<td>" + name + "</td>");
    out.println("<td>" + email + "</td>");
    out.println("<td>" + phone + "</td>");
    out.println("</tr>");
}
out.println("</table>");

// Get all teachers from the database
rs = stmt.executeQuery("SELECT name, email, mobile FROM form_det WHERE email LIKE '%@tce.edu'");

// Build the HTML table
out.println("<br><br><br>");
out.println("<h1 style=\"color:#f2f2f2;text-align:center\">Teachers List</h2>");
out.println("<table>");
out.println("<tr>");
out.println("<th>Name</th>");
out.println("<th>Email</th>");
out.println("<th>Phone</th>");
out.println("</tr>");
while (rs.next()) {
    String name = rs.getString("name");
    String email = rs.getString("email");
    String phone = rs.getString("mobile");

    out.println("<tr>");
    out.println("<td>" + name + "</td>");
    out.println("<td>" + email + "</td>");
    out.println("<td>" + phone + "</td>");
    out.println("</tr>");
}
out.println("</table>");
out.println("</body>");
// Close the database connection and release resources
rs.close();
stmt.close();
con.close();
%>

</html>