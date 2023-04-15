<% 
String email = (String)session.getAttribute("email");
session.setAttribute("email", email);
%>
<!DOCTYPE html>
<html>
<head>
    
	<title>Student Portal</title>
	<style>
		body {
			font-family: Arial, sans-serif;
			background-color: #f2f2f2;
			margin: 0;
			padding: 0;
		}

		.container {
			max-width: 800px;
			margin: 0 auto;
			padding: 20px;
			text-align: center;
		}

		h1 {
			font-size: 36px;
			margin: 0 0 20px 0;
		}

		.options {
			display: flex;
			flex-wrap: wrap;
			justify-content: center; /* Changed this line to center the options */
			align-items: center;
			margin: 0 -10px;
		}

		.option {
			flex-basis: calc(50% - 20px);
			background-color: #ffffff;
			border-radius: 5px;
			box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
			padding: 30px 20px;
			margin: 0 10px 20px 10px;
			text-align: center;
			transition: all 0.3s ease-in-out;
			cursor: pointer; /* Added this line to make the options clickable */
		}

		.option:hover {
			transform: translateY(-5px);
			box-shadow: 0 7px 15px rgba(0, 0, 0, 0.2);
		}

		.option h2 {
			font-size: 24px;
			margin: 0 0 10px 0;
		}

		.option p {
			font-size: 16px;
			margin: 0;
		}

		.option i {
			font-size: 48px;
			margin: 0 0 10px 0;
			color: #007bff;
		}
	</style>
</head>
<body style="background-color:black" >
    <img src='skill.png' width="300" height="50">
	<div class="container">
		<div class="options">
			<div class="option" onclick="location.href='attendancep.jsp'">
				<i class="fas fa-chart-bar"></i>
				<h2>Attendance</h2>
				<p>Enter attendance for the class</p>
			</div>
			<div class="option" onclick="location.href='marksp.jsp'">
				<i class="fas fa-graduation-cap"></i>
				<h2>Marks</h2>
				<p>Enter the marks for the subjects</p>
			</div>
			<div class="option" onclick="location.href='sportsp.jsp'">
				<i class="fas fa-trophy"></i>
				<h2>Sports Excellence</h2>
				<p>Enter the student's achievements</p>
			</div>
		</div>
	</div>
</body>
</html>
