<%@ page import="java.sql.*" %>
<html>
<head>
    <title>Save Marks</title>
</head>
<body>
<%
    // Get form parameters
    String name = request.getParameter("name");
    int math = Integer.parseInt(request.getParameter("math"));
    int phy = Integer.parseInt(request.getParameter("phy"));
    int che = Integer.parseInt(request.getParameter("che"));
    int eng = Integer.parseInt(request.getParameter("eng"));
    int csc = Integer.parseInt(request.getParameter("csc"));
    String test = request.getParameter("test");

    // Connect to the database
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/skilltracker", "root", "");

    // Insert the marks into the database
    PreparedStatement stmt = con.prepareStatement("INSERT INTO mark (name, math, phy, che, eng, csc, test) VALUES (?, ?, ?, ?, ?, ?, ?)");
    stmt.setString(1, name);
    stmt.setInt(2, math);
    stmt.setInt(3, phy);
    stmt.setInt(4, che);
    stmt.setInt(5, eng);
    stmt.setInt(6, csc);
    stmt.setString(7, test);
    int result = stmt.executeUpdate();

    // Check if the insertion was successful
    if(result > 0) {
        out.println("<h2>Marks added successfully for " + name + "</h2>");
    } else {
        out.println("<h2>Failed to add marks for " + name + "</h2>");
    }

    // Close the database connection and release resources
    stmt.close();
    con.close();
%>
</body>
</html>
