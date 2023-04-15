<%@ page import="java.sql.*" %>
<html>
<head>
    <title>Add Marks</title>
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
			width: 20%;
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
    <h1 style="color:#f2f2f2">Add Marks</h1>
    <form method="post" action="savemarks.jsp">
        <% 
            // Connect to the database
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/skilltracker", "root", "");
            // Retrieve the names of students with email domain student.tce.edu from the table
            PreparedStatement stmt = con.prepareStatement("SELECT * FROM form_det WHERE email LIKE '%student.tce.edu'");
            ResultSet rs = stmt.executeQuery();
            // Loop through the records and display them in the HTML table
            while(rs.next()) 
			{ %>
                <table>
                    <tr>
                        <td>Name:</td>
                        <td><input type="text" name="name" value="<%= rs.getString("Email") %>"/></td>

                    </tr>
                    <tr>
                        <td>Maths:</td>
                        <td><input type="text" name="math"/></td>
                    </tr>
                    <tr>
                        <td>Physics:</td>
                        <td><input type="text" name="phy"/></td>
                    </tr>
                    <tr>
                        <td>Chemistry:</td>
                        <td><input type="text" name="che"/></td>
                    </tr>
                    <tr>
                        <td>English:</td>
                        <td><input type="text" name="eng"/></td>
                    </tr>
                    <tr>
                        <td>Computer Science:</td>
                        <td><input type="text" name="csc"/></td>
                    </tr>
                    <tr>
                        <td>Test:</td>
                        <td><input type="text" name="test"/></td>
                    </tr>
                </table>
           <% }
            // Close the database connection and release resources
            rs.close();
            stmt.close();
            con.close();
        %>
    </table>
    <br>
    <div class="w3-container w3-center">  
        <input type="submit" class="w3-button w3-grey w3-mobile" value="Save Marks"/>
      </div>
   
    
    </form>
</body>
</html>
