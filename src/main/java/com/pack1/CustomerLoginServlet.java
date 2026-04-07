package com.pack1;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/clog")
public class CustomerLoginServlet extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req,HttpServletResponse res) throws ServletException,IOException{
		CustomerBean c_bean=new CustomerLoginDAO().check_customerLogin(req.getParameter("c_name"),req.getParameter("c_pwd"));
		if(c_bean==null) {
			req.setAttribute("msg","Invalid Login Credentials");
			req.getRequestDispatcher("CustomerLogin.jsp").forward(req, res);
		}
		else {
			HttpSession session=req.getSession();
			session.setAttribute("cbean", c_bean);
			req.getRequestDispatcher("CustomerHome.jsp").forward(req, res);
		}
	}

}

