<%@page import="com.pack1.ProductBean"%>
<%@page import="com.pack1.AdminBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<center>
		
		<h1>
			<%
			AdminBean ab=(AdminBean)session.getAttribute("abean");
			ProductBean pb=(ProductBean)request.getAttribute("pbean");
			out.println("Hello Mr."+ab.getaFname()+"below are the products details available for edit<br><br>");
			%>
			<form action="update" method="post">
			
			Product Price <input type="text" name=pprice value="<%=pb.getpPrice() %>"><br><br>
	    	Product Quantity <input type="text" name=pqty value="<%=pb.getpQty() %>"><br><br>
	    	
	    	<input type="hidden" name=pcode value="<%=pb.getpCode() %>">
	    	<input type="submit" value="update Product"/>
		    </form>
		</h1>
</body>
</html>