<%@page import="java.util.Iterator"%>
<%@page import="com.pack1.ProductBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.pack1.CustomerBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>
			<%
			CustomerBean cb=(CustomerBean)session.getAttribute("abean");
			ProductBean pb=(ProductBean)request.getAttribute("pbean");
			out.println("Hello Mr."+cb.getFname()+"below are the products details available for edit<br><br>");
			%>
			<form action="update" method="post">
			
			Product Price <input type="text" name=pprice value="<%=pb.getpPrice() %>"><br><br>
	    	Product Quantity <input type="text" name=pqty value="<%=pb.getpQty() %>"><br><br>
	    
	    	
	    	<input type="hidden" name=pcode value="<%=pb.getpCode() %>">
	    	<input type="submit" value="update Product"/>
		    </form>
		</h1>

<center>
	<form action="buyproduct" method="post">
		
			Product Code <input type="text" name="pcode">value="<%=pb.getpPrice() %>"><br><br><br><br>
			Product Name <input type="text" name="pname"><br><br>
			Product Company <input type="text" name="pcompany"><br><br>
			Product Price <input type="text" name="pprice"><br><br>
			Product Quantity <input type="text" name="pqty"><br><br>
		    
		    Product ReqNo <input type="text" name="reqno"><br><br>
			
			<input type="submit" value="Buy"/>
		
		</form>
				<%
				
				
				
				
				%>
</body>
</html>