  <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Login</title>
</head>
<body>
	<center>
		

		<% 
			String msg = (String) request.getAttribute("msg");
	      	out.println("<h2>"+msg+"</h2><br>");
		%>

		<jsp:include page="AdminLogin.html"/>

</body>
</html> 