package com.pack1;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class BuyProductServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req,HttpServletResponse res) throws ServletException,IOException{
		HttpSession session=req.getSession(false);
		if(session==null) {
			req.getRequestDispatcher("AdminLogin.html").forward(req, res);
		}
		else {
			ArrayList <ProductBean> al=new BuyProductServletDAO().buyProduct();
			session.setAttribute("productList", al);
			req.getRequestDispatcher("ViewProduct.jsp").forward(req, res);
		}
	}
}
//=============================================================================

//@WebServlet("/BuyProductServlet")
//public class BuyProductServlet extends HttpServlet {
//    private static final long serialVersionUID = 1L;
//
//    protected void doPost(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//
//        response.setContentType("text/html");
//        PrintWriter out = response.getWriter();
//
//        String pcode = request.getParameter("pcode");
//        String pname = request.getParameter("pname");
//        String pcompany = request.getParameter("pcompany");
//        double price = Double.parseDouble(request.getParameter("price"));
//        int pqty = Integer.parseInt(request.getParameter("pqty"));
//        String reqno = request.getParameter("reqno");
//
//        // Call DAO class to insert record
//        BuyProductServletDAO dao = new BuyProductServletDAO();
//        boolean status = dao.insertProduct(pcode, pname, pcompany, price, pqty, reqno);
//
//        if (status) {
//            request.setAttribute("message", "Your order has been placed successfully!");
//            RequestDispatcher rd = request.getRequestDispatcher("OrderConfirmed.jsp");
//            rd.forward(request, response);
//        } else {
//            out.println("<h3 style='color:red;'>Error while processing your order!</h3>");
//            RequestDispatcher rd = request.getRequestDispatcher("BuyProduct.jsp");
//            rd.include(request, response);
//        }
//
//        out.close();
//    }
//}





//-------------------------------------------------------

//<%@ page import="com.store.dao.ProductDAO,com.store.bean.Product" %>
//<%
//int id = Integer.parseInt(request.getParameter("id"));
//ProductDAO dao = new ProductDAO();
//Product p = dao.getProductById(id);
//%>
//<!DOCTYPE html>
//<html>
//<head><title>Buy Product</title></head>
//<body>
//<h2>Buy Product</h2>
//<form action="BuyProductServlet" method="post">
//    <input type="hidden" name="id" value="<%=p.getId()%>">
//    <p><b>Product:</b> <%=p.getName()%></p>
//    <p><b>Company:</b> <%=p.getCompany()%></p>
//    <p><b>Price:</b> ₹<%=p.getPrice()%></p>
//    <p><b>How much quantity do you want to buy?</b></p>
//    <input type="number" name="qty" required min="1">
//    <br><br>
//    <input type="submit" value="Confirm Buy">
//</form>
//</body>
//</html>



//---------------------------------------------
//package com.store.servlet;
//
//import java.io.*;
//import jakarta.servlet.*;
//import jakarta.servlet.annotation.WebServlet;
//import jakarta.servlet.http.*;
//import com.store.dao.ProductDAO;
//import com.store.bean.Product;
//
//@WebServlet("/BuyProductServlet")
//public class BuyProductServlet extends HttpServlet {
//    protected void doPost(HttpServletRequest req, HttpServletResponse res)
//            throws ServletException, IOException {
//
//        int id = Integer.parseInt(req.getParameter("id"));
//        int qty = Integer.parseInt(req.getParameter("qty"));
//
//        ProductDAO dao = new ProductDAO();
//        Product p = dao.getProductById(id);
//        double total = p.getPrice() * qty;
//
//        // Save order in DB
//        dao.saveOrder(id, qty, total);
//
//        // Forward to confirmation
//        req.setAttribute("pname", p.getName());
//        req.setAttribute("qty", qty);
//        req.setAttribute("price", p.getPrice());
//        req.setAttribute("total", total);
//
//        RequestDispatcher rd = req.getRequestDispatcher("orderConfirm.jsp");
//        rd.forward(req, res);
//    }
//}

