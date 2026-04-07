<%-- <%@page import="com.pack1.AdminBean"%>
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
		    out.println("Welcome Mr."+abean.getaFname()+"!!!<br><br>");
		%>
			<a href="AddProduct.html">Add Product</a><br><br>
			<a href="view1">View Product</a><br><br>
			<a href="Logout">Logout</a><br><br>
	</h1>
</body>
</html> --%>

<%@page import="com.pack1.AdminBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Admin Dashboard</title>

<!-- ====== CSS Styling ====== -->
<style>
    /* ---- Dark Neon Background ---- */
    body {
        margin: 0;
        padding: 0;
        height: 100vh;
        font-family: 'Poppins', sans-serif;
        background: radial-gradient(circle at center, #0a0a0a 0%, #000 100%);
        color: #0ff;
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        overflow: hidden;
    }

    /* ---- Glowing Heading ---- */
    h1 {
        font-size: 2.5rem;
        text-shadow: 0 0 15px #00ffff, 0 0 25px #00ffff, 0 0 40px #00ffff;
        animation: glow 2s infinite alternate;
        margin-bottom: 40px;
    }

    @keyframes glow {
        from { text-shadow: 0 0 10px #00ffff; }
        to { text-shadow: 0 0 25px #00ffff, 0 0 50px #00ffff; }
    }

    /* ---- Neon Animated Buttons ---- */
    .btn {
        display: inline-block;
        padding: 14px 40px;
        margin: 15px;
        font-size: 1.2rem;
        color: #0ff;
        text-decoration: none;
        border: 2px solid #0ff;
        border-radius: 30px;
        text-transform: uppercase;
        letter-spacing: 1px;
        background: transparent;
        position: relative;
        overflow: hidden;
        transition: 0.3s ease-in-out;
        z-index: 1;
        box-shadow: 0 0 10px #0ff, inset 0 0 10px #0ff;
    }

    .btn:hover {
        color: #000;
        background: #0ff;
        box-shadow: 0 0 20px #0ff, 0 0 40px #0ff, 0 0 80px #0ff;
        transform: scale(1.05);
    }

    /* ---- Glow Pulse Animation ---- */
    @keyframes pulse {
        0% { box-shadow: 0 0 10px #0ff, inset 0 0 10px #0ff; }
        50% { box-shadow: 0 0 25px #0ff, inset 0 0 15px #0ff; }
        100% { box-shadow: 0 0 10px #0ff, inset 0 0 10px #0ff; }
    }
    .btn {
        animation: pulse 2s infinite;
    }

    /* ---- Floating Neon Orbs (Background Animation) ---- */
    .neon-orb {
        position: absolute;
        border-radius: 50%;
        background: rgba(0, 255, 255, 0.08);
        filter: blur(50px);
        animation: float 15s infinite ease-in-out;
    }

    .neon-orb:nth-child(1) {
        width: 200px; height: 200px;
        top: 10%; left: 15%;
        animation-delay: 0s;
    }
    .neon-orb:nth-child(2) {
        width: 150px; height: 150px;
        bottom: 20%; right: 20%;
        animation-delay: 3s;
    }

    @keyframes float {
        0% { transform: translate(0, 0) scale(1); }
        50% { transform: translate(50px, 50px) scale(1.5); }
        100% { transform: translate(0, 0) scale(1); }
    }

    /* ---- Footer Small Text ---- */
    footer {
        position: absolute;
        bottom: 10px;
        color: #088;
        font-size: 0.9rem;
        text-shadow: 0 0 10px #088;
    }
</style>
</head>

<body>

    <!-- Neon floating orbs for visual effect -->
    <div class="neon-orb"></div>
    <div class="neon-orb"></div>

    <!-- Welcome Section -->
    <h1 id="welcomeText">
        <% 
            AdminBean abean = (AdminBean) session.getAttribute("abean");
            out.println("Welcome Mr. " + abean.getaFname() + "!");
        %>
    </h1>

    <!-- Action Buttons -->
    <a href="AddProduct.html" class="btn">Add Product</a>
    <a href="view1" class="btn">View Product</a>
    <a href="Logout" class="btn">Logout</a>

    <!-- Footer -->
    <footer>© 2025 Admin Control Panel</footer>

<!-- ====== JavaScript for simple animations ====== -->
<script>
    // Add subtle fade-in animation effect
    document.body.style.opacity = "0";
    document.body.style.transition = "opacity 2s ease";

    window.onload = function() {
        document.body.style.opacity = "1";
    };

    // Button click ripple effect (gaming style)
    const buttons = document.querySelectorAll(".btn");
    buttons.forEach(btn => {
        btn.addEventListener("click", e => {
            let ripple = document.createElement("span");
            ripple.classList.add("ripple");
            btn.appendChild(ripple);
            setTimeout(() => ripple.remove(), 600);
        });
    });
</script>

</body>
</html>
