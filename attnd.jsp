<%@ page import="java.sql.*" %>
<%@ page import="java.sql.*,java.util.*" %>
<%@ page import="java.text.DecimalFormat" %>
<html>
<head>
    <title>Attendance Report</title>
    <link rel="icon" type="image/x-icon" href="fav.png">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lobster">
    <style>
        body {
			font-family: Arial, sans-serif;
			background-color: #f2f2f2;
			background-image: url('back.jpg');
         	background-repeat: no-repeat;
        	background-attachment: fixed;
        	background-size: cover;
		}
		h1 {
			text-align: center;
			color: #555;
		}
		p ,h6{
			text-align: center;
		}
		table {
			margin: auto;
			border-collapse: collapse;
			border-spacing: 0;
			width: 40%;
			border: 3px solid #FF0000;
			background-color: wheat;
			box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
		}
		th, td {
			text-align: left;
			padding: 25px;
			border-bottom: 1px solid black;
		}
		tr:hover {
			background-color: gray;
		}
    </style>
</head>
<body>
    <img id="im" src='skill.png' width="300" height="50">
    <div class="w3-right-align">
        <button class="w3-button w3-grey w3-mobile" onclick = "window.location.href = 'home.html';" ><b>HOME</b></button>
        <button class="w3-button w3-grey w3-mobile" onclick = "window.location.href = 'about.html';" ><b>About Us</b></button>
        <button class="w3-button w3-grey w3-mobile" onclick = "window.location.href = 'contactus.html';"><b>Contact Us</b></button>
        <button class="w3-button w3-grey w3-mobile" onclick = "window.location.href = 'ppolicy.html';"><b>Privacy Policy</b></button>
        <button class="w3-button w3-grey w3-mobile" onclick = "window.location.href = 'faq.html';"><b>FAQ</b></button>
        <button class="w3-button w3-grey w3-mobile" onclick = "window.location.href = 'login.html';"><b>Admin</b></button>
        </div>
        <br><br>
	<h1 style="color:white; font-family: 'Courier New', Courier, monospace;"><b>ATTENDANCE DETAILS</b></h1>
    <br><br> <br><br>
        <% 
            // Connect to the database
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/skilltracker", "root", "");
            String email = (String)session.getAttribute("email");
            // Retrieve the total number of classes attended and the total number of classes
PreparedStatement stmt1 = con.prepareStatement("SELECT COUNT(*) FROM attendance WHERE name = ?");
stmt1.setString(1, email);
ResultSet rs1 = stmt1.executeQuery();
rs1.next();
int attendedClasses = rs1.getInt(1);
stmt1.close();

PreparedStatement stmt2 = con.prepareStatement("SELECT COUNT(*) FROM attendance");
ResultSet rs2 = stmt2.executeQuery();
rs2.next();
int totalClasses = rs2.getInt(1);
stmt2.close();

// Calculate the attendance percentage
double attendancePercentage = ((double)attendedClasses / totalClasses) * 100;
DecimalFormat df = new DecimalFormat("#.##");

// Display the attendance percentage for the student
%>
<table>
    <tr>
      <td>
        Total Classes Attended
      </td>
      <td>
        <%= attendedClasses %>
      </td>
    </tr>
    <tr>
       <td>
        Total Classes
      </td>
      <td>
        <%= totalClasses %>
      </td>
    </tr>
    <tr>
        <td>
            Attendance Percentage
        </td>
        <td>
            <%= df.format(attendancePercentage) %>
        </td>
    </tr>
</table>
<%
// Close the database connection and release resources
con.close();
%>
</body>
</html>
