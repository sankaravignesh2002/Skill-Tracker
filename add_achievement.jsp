<%@ page import="java.sql.*" %>
<%
    // Get the form data
    String username = request.getParameter("username");
    String description = request.getParameter("description");

    // Connect to the database
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/skilltracker", "root", "");

    // Insert the data into the "sports" table
    PreparedStatement stmt = con.prepareStatement("INSERT INTO sports (name, achi) VALUES (?, ?)");
    stmt.setString(1, username);
    stmt.setString(2, description);
    int rowsAffected = stmt.executeUpdate();

    // Close the database connection and release resources
    stmt.close();
    con.close();
%>
<html>
<head>
    <title>Add Sports Achievement</title>
</head>
<body>
    <h1>Add Sports Achievement</h1>
    <% if(rowsAffected > 0) { %>
        <p>Achievement added successfully!</p>
    <% } else { %>
        <p>There was an error adding the achievement.</p>
    <% } %>
</body>
</html>
