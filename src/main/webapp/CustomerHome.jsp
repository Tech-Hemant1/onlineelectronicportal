<%-- <%@page import="com.pack1.CustomerBean"%>
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
      CustomerBean cbean=(CustomerBean)session.getAttribute("cbean");
          out.println("Welcome Mr. " + cbean.getFname() + "!!!<br><br>");
    %>
    <a href="ViewCustomerProduct">View Product</a><br><br>
    <a href="Logout">Logout</a><br><br>
  </h1> 
</body>
</html> --%>



<%@page import="com.pack1.CustomerBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Customer Dashboard</title>

<style>
    body {
        background-color: #0d0d0d;
        color: #00ffff;
        font-family: 'Poppins', sans-serif;
        text-align: center;
        margin-top: 10%;
        overflow: hidden;
    }

    h1 {
        text-shadow: 0 0 15px #00ffff, 0 0 30px #00ffff;
        animation: glowPulse 2s infinite alternate;
    }

    a {
        display: inline-block;
        text-decoration: none;
        color: #00ffff;
        font-size: 20px;
        margin: 20px;
        padding: 12px 30px;
        border: 2px solid #00ffff;
        border-radius: 30px;
        box-shadow: 0 0 10px #00ffff, 0 0 20px #00ffff inset;
        transition: all 0.3s ease-in-out;
        position: relative;
    }

    a:hover {
        background-color: #00ffff;
        color: #0d0d0d;
        box-shadow: 0 0 25px #00ffff, 0 0 50px #00ffff;
        transform: scale(1.1);
    }

    @keyframes glowPulse {
        from { text-shadow: 0 0 10px #00ffff, 0 0 20px #00ffff; }
        to { text-shadow: 0 0 30px #00ffff, 0 0 60px #00ffff; }
    }

    /* Background animated gradient */
    body::before {
        content: '';
        position: fixed;
        top: 0; left: 0;
        width: 100%; height: 100%;
        background: linear-gradient(120deg, #001f3f, #000000, #002b36);
        background-size: 400% 400%;
        animation: gradientMove 10s ease infinite;
        z-index: -1;
    }

    @keyframes gradientMove {
        0% { background-position: 0% 50%; }
        50% { background-position: 100% 50%; }
        100% { background-position: 0% 50%; }
    }
</style>

<script>
    document.addEventListener('DOMContentLoaded', () => {
        const links = document.querySelectorAll('a');
        links.forEach(link => {
            link.addEventListener('mouseover', () => {
                link.style.transition = '0.2s';
                link.style.letterSpacing = '1px';
            });
            link.addEventListener('mouseout', () => {
                link.style.letterSpacing = '0px';
            });
        });
    });
</script>
</head>
<body>

<%
    CustomerBean cbean = (CustomerBean)session.getAttribute("cbean");
%>

<h1>Welcome Mr. <%= cbean.getFname() %> !!!</h1>

<a href="ViewCustomerProduct">View Product</a>
<a href="Logout">Logout</a>

</body>
</html>
