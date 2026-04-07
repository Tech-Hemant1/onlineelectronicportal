<%-- <%@page import="java.util.Iterator"
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
	<center>
			<h1>
				<%
				CustomerBean cbean=(CustomerBean)session.getAttribute("cbean");
	      		ArrayList<ProductBean> al=(ArrayList<ProductBean>)session.getAttribute("productList");
	      		out.println(" Mr."+cbean.getFname()+"below are your product details<br><br>");
	      		if(al.size()==0){
	      			out.println("Product are not available!!!!!!!!!:("); 
	      		}
	      		else{
	      			Iterator<ProductBean> i=al.iterator(); 
	      			while(i.hasNext()){
	      				ProductBean pb=i.next();
	      				out.println(pb.getpCode()+"|"+pb.getpName()+"|"+pb.getpCompany()+"|"+pb.getpPrice()+"|"+pb.getpQty()
	      						+"<a href='delete?pcode="+pb.getpCode()+"'>Buy</a>"+"<br><br>");
	      			}
	      		}
				%>
				<a href="Logout">logout</a>
			</h1>
</body>
</html> --%>




<%@page import="java.util.Iterator"%>
<%@page import="com.pack1.ProductBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.pack1.CustomerBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Customer Products</title>

<style>
    body {
        background: radial-gradient(circle at top left, #00111a, #000000);
        font-family: 'Poppins', sans-serif;
        color: #00ffff;
        text-align: center;
        margin: 0;
        padding: 0;
        overflow-x: hidden;
    }

    h1 {
        margin-top: 40px;
        text-shadow: 0 0 15px #00ffff, 0 0 30px #00ffff;
        animation: pulse 2s infinite alternate;
    }

    .product-container {
        display: flex;
        flex-wrap: wrap;
        justify-content: center;
        gap: 25px;
        padding: 30px;
    }

    .product-card {
        background: rgba(0, 20, 30, 0.8);
        border: 2px solid #00ffff;
        border-radius: 15px;
        width: 320px;
        padding: 20px;
        box-shadow: 0 0 20px #00ffff33;
        transition: 0.3s;
    }

    .product-card:hover {
        transform: scale(1.05);
        box-shadow: 0 0 25px #00ffff, 0 0 50px #00ffff66;
    }

    .product-info {
        margin-bottom: 20px;
        font-size: 18px;
        line-height: 1.6;
    }

    a.btn {
        text-decoration: none;
        padding: 10px 25px;
        border-radius: 25px;
        border: 2px solid #00ffff;
        color: #00ffff;
        font-weight: bold;
        transition: all 0.3s ease;
        box-shadow: 0 0 15px #00ffff, inset 0 0 10px #00ffff44;
    }

    a.btn:hover {
        background-color: #00ffff;
        color: #000;
        box-shadow: 0 0 25px #00ffff, 0 0 50px #00ffff;
        transform: scale(1.1);
    }

    .logout-btn {
        margin-top: 40px;
        display: inline-block;
    }

    @keyframes pulse {
        0% { text-shadow: 0 0 15px #00ffff, 0 0 30px #00ffff; }
        100% { text-shadow: 0 0 35px #00ffff, 0 0 70px #00ffff; }
    }

    /* Animated background */
    body::before {
        content: '';
        position: fixed;
        top: 0; left: 0;
        width: 100%; height: 100%;
        background: linear-gradient(120deg, #001f3f, #000, #002b36);
        background-size: 400% 400%;
        animation: bgMove 10s ease infinite;
        z-index: -1;
    }

    @keyframes bgMove {
        0% { background-position: 0% 50%; }
        50% { background-position: 100% 50%; }
        100% { background-position: 0% 50%; }
    }
</style>

<script>
document.addEventListener('DOMContentLoaded', () => {
    const cards = document.querySelectorAll('.product-card');
    cards.forEach((card, index) => {
        card.style.opacity = '0';
        setTimeout(() => {
            card.style.transition = 'opacity 0.6s ease, transform 0.5s ease';
            card.style.opacity = '1';
            card.style.transform = 'translateY(0)';
        }, 150 * index);
    });
});
</script>
</head>

<body>
<%
    CustomerBean cbean = (CustomerBean)session.getAttribute("cbean");
    ArrayList<ProductBean> al = (ArrayList<ProductBean>)session.getAttribute("productList");
%>

<h1>Welcome Mr. <%= cbean.getFname() %> — Below are your Product Details</h1>

<div class="product-container">
<%
    if (al == null || al.size() == 0) {
%>
    <h2 style="color:red;">Products are not available 😞</h2>
<%
    } else {
        Iterator<ProductBean> i = al.iterator();
        while (i.hasNext()) {
            ProductBean pb = i.next();
%>
        <div class="product-card">
            <div class="product-info">
                <strong>Code:</strong> <%= pb.getpCode() %><br>
                <strong>Name:</strong> <%= pb.getpName() %><br>
                <strong>Company:</strong> <%= pb.getpCompany() %><br>
                <strong>Price:</strong> ₹<%= pb.getpPrice() %><br>
                <strong>Quantity:</strong> <%= pb.getpQty() %><br>
            </div>
            <a href="delete?pcode=<%= pb.getpCode() %>" class="btn">Buy</a>
        </div>
<%
        }
    }
%>
</div>

<a href="Logout" class="btn logout-btn">Logout</a>

</body>
</html>
