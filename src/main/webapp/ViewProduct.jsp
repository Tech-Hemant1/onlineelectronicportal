<%@page import="java.util.Iterator"%>
<%@page import="com.pack1.AdminBean"%>
<%@page import="com.pack1.ProductBean"%>
<%@page import="java.util.ArrayList"%>
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
				AdminBean abean=(AdminBean)session.getAttribute("abean");
	      		ArrayList<ProductBean> al=(ArrayList<ProductBean>)session.getAttribute("productList");
	      		out.println(" Mr."+abean.getaFname()+"below are your product details");
	      		if(al.size()==0){
	      			out.println("Product are not available!!!!!!!!!:(");
	      		}
	      		else{
	      			Iterator<ProductBean> i=al.iterator();
	      			while(i.hasNext()){
	      				ProductBean pb=i.next();
	      				out.println(pb.getpCode()+"|"+pb.getpName()+"|"+pb.getpCompany()+"|"+pb.getpPrice()+"|"+pb.getpQty()+
	      						"|" +"<a href='edit?pcode="+pb.getpCode()+"'>Edit</a>"+"|"
	      						+"<a href='delete?pcode="+pb.getpCode()+"'>Delete</a>"+"<br><br>");
	      			}
	      		}
				%>
				<a href="Logout">logout</a>
			</h1>
</body>
</html>