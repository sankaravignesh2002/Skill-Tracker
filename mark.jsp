<%@ page import="java.io.*, java.util.*" %>
<!DOCTYPE html>
<html>
<head>
	<title>ACADEMIC PROGRESS TRACKER</title>
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
		p {
			text-align: center;
		}
		table {
			margin: auto;
			border-collapse: collapse;
			border-spacing: 0;
			width: 80%;
			border: 3px solid #FF0000;
			background-color: #fff;
			box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
		}
		th, td {
			text-align: left;
			padding: 16px;
			border-bottom: 1px solid #ddd;
		}
		tr:hover {
			background-color: gray;
		}
	</style>
</head>
<body>
	<img id="im" src='skill.png' width="300" height="50">
	<h1 style="color:white;">MARK DETAILS</h1>
	<%
		// Read data from text file
		String filePath = "C:/Program Files/Apache Software Foundation/Tomcat 8.5/webapps/ROOT/students.txt";
		File file = new File(filePath);
		Scanner scanner = new Scanner(file);
		String regNo = "1234"; // Replace with the desired registration number
		// Loop through each line and extract student data
		boolean found = false;
		while (scanner.hasNextLine()) {
			String line = scanner.nextLine();
			String[] student = line.split("\\s+");
			// Check if the student's registration number matches the input
			if (student[0].equals(regNo)) {
				found = true;
				// Calculate total marks and percentage
				int total = Integer.parseInt(student[1]) + Integer.parseInt(student[2]) + Integer.parseInt(student[3]) + Integer.parseInt(student[4]) + Integer.parseInt(student[5]);
				double percentage = (double)total / 5;
	%>
	<p style="color:white;"><strong>Registration number:</strong> <%= student[0] %></p>
	<table>
		<tr>
			<th>Subject</th>
			<th>Marks</th>
		</tr>
		<tr>
			<td>Maths</td>
			<td><b><%= student[1] %></b></td>
		</tr>
		<tr>
			<td>Physics</td>
			<td><b><%= student[2] %></b></td>
		</tr>
		<tr>
			<td>Computer Science</td>
			<td><b><%= student[3] %></b></td>
		</tr>
		<tr>
			<td>Chemistry</td>
			<td><b><%= student[4] %></b></td>
		</tr>
		<tr>
			<td>English</td>
			<td><b><%= student[5] %></b></td>
		</tr>
		<tr>
			<th>Total</th>
			<td><b><%= total %>/500</b></td>
		</tr>
		<tr>
			<th>Percentage</th>
			<td><b><%= percentage %></b></td>
		</tr>
	</table>
	<%
				break;
			}
		}
		if (!found) {
	%>
	<p>No data found for registration number <%= regNo %>.</p>
	<%
		}
		scanner.close();
	%>
</body>
</html>
