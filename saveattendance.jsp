<%@ page import="java.sql.*,java.util.*" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.sql.Date" %>
<%
// Get the connection to the database
// Connect to the database
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/skilltracker", "root", "");

// Loop through the request parameters to insert the attendance details for each student



Enumeration<String> paramNames = request.getParameterNames();
while (paramNames.hasMoreElements()) {
    String paramName = paramNames.nextElement();

        String email = paramName.substring(0);
        if(email.contains("student.tce.edu"))
        {
            String attendance = request.getParameter(paramName);

        // Insert the attendance details into the database
        PreparedStatement stmt = con.prepareStatement("INSERT INTO attendance (date, name, present, absent) VALUES (?, ?, ?, ?)");
        LocalDate localDate = LocalDate.now();
        Date sqlDate = Date.valueOf(localDate);
        stmt.setDate(1, sqlDate);
        stmt.setString(2, email);
        if (attendance.equals("Present")) {
            stmt.setString(3, "Yes");
            stmt.setString(4, "No");
        } else {
            stmt.setString(3, "No");
            stmt.setString(4, "Yes");
        }
        int result=1;
        if(result > 0) {
            out.println("<h2>Attendance was updated </h2>");
        } else {
            out.println("<h2>Attendance was not updated</h2>");
        }
        stmt.executeUpdate();
        stmt.close();
        }
    
}

// Close the database connection and release resources
con.close();
%>


