package com.pack1;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/customerreg")

public class CustomerRegistrationServlet extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req,HttpServletResponse res) throws ServletException,IOException{
		CustomerBean cb=new CustomerBean();
		 
		cb.setUsername(req.getParameter("uname"));
		cb.setPass(req.getParameter("upwd"));
		cb.setFname(req.getParameter("fname"));
		cb.setLname(req.getParameter("lname"));
		cb.setAddr(req.getParameter("addr"));
		cb.setMailId(req.getParameter("mid"));
		cb.setMobile(req.getParameter("phno"));
		
		CustomerRegisterDAO cdao=new CustomerRegisterDAO();
		
		int rowCount=cdao.insertData(cb);
		
		if(rowCount>0) {
			req.setAttribute("msg","User Registration Successfully");
			req.getRequestDispatcher("CustomerRegister.jsp").forward(req,res);
		}else {
			req.setAttribute("msg", "User Registration Failed!!");
			req.getRequestDispatcher("CustomerRegister.jsp").forward(req,res);
		}
	}
}
//protected void doPost(HttpServletRequest req,HttpServletResponse res) throws ServletException,IOException{
//	UserBean ub=new UserBean();
//	//uname,upwd,ufname,ulname,umail,uphone
//	ub.setUser_name(req.getParameter("uname"));
//	ub.setUser_password(req.getParameter("upwd"));
//	ub.setUser_fname(req.getParameter("ufname"));
//	ub.setUser_lname(req.getParameter("ulname"));
//	ub.setUser_mail(req.getParameter("umail"));
//	ub.setUser_phone(req.getParameter("uphone"));
//	
//	UserRegisterDAO udao=new UserRegisterDAO();
//	
//	int rowCount=udao.insertUserData(ub);
//	
//	if(rowCount>0) {
//		req.setAttribute("msg","User Registration Successfully");
//		req.getRequestDispatcher("Register.jsp").forward(req,res);
//	}else {
//		req.setAttribute("msg", "User Registration Failed!!");
//		req.getRequestDispatcher("Register.jsp").forward(req,res);
//	}
//  }