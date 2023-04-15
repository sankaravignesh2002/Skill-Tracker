<%@ page import="java.sql.*" %>
<html>
<head>
    <title>Mark Report</title>
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
			border-bottom: 1px solid #ddd;
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
	<h1 style="color:white; font-family: 'Courier New', Courier, monospace;"><b>MARK DETAILS</b></h1>
    <br><br>
    <table>
        <tr>
            <th>Name</th>
            <th>Test</th>
            <th>Math</th>
            <th>Physics</th>
            <th>Chemistry</th>
            <th>English</th>
            <th>Computer Science</th>
        </tr>
        <% 
            // Connect to the database
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/skilltracker", "root", "");
            // Retrieve the attendance records from the table
            Statement stmt = con.createStatement();
            String email = (String)session.getAttribute("email");
            ResultSet rs = stmt.executeQuery("SELECT * FROM mark WHERE name='" + email + "'");
            // Loop through the records and display them in the HTML table
            while(rs.next()) 
			{
                out.println("<tr>");
                out.println("<td>" + rs.getString("name") + "</td>");
                out.println("<td>" + rs.getString("test") + "</td>");
                out.println("<td>" + rs.getInt("math") + "</td>");
                out.println("<td>" + rs.getInt("phy") + "</td>");
                out.println("<td>" + rs.getInt("che") + "</td>");
                out.println("<td>" + rs.getInt("eng") + "</td>");
                out.println("<td>" + rs.getInt("csc") + "</td>");
                out.println("</tr>");
            }
            // Close the database connection and release resources
            rs.close();
            stmt.close();
            con.close();
        %>
    </table>
</body>
</html>
