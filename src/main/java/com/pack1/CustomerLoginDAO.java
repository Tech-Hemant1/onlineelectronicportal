package com.pack1;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class CustomerLoginDAO {
	public CustomerBean check_customerLogin(String userName,String Password){
		
		CustomerBean c_bean=null;
		try {
			Connection con=DBConnect.connect();
			PreparedStatement pstmt=con.prepareStatement("select * from mydb2pm.customer where uname=? and pword=?");
					pstmt.setString(1, userName);
					pstmt.setString(2, Password);
					ResultSet rs=pstmt.executeQuery();
					if(rs.next()) {
						c_bean=new CustomerBean();
						c_bean.setUsername(rs.getString(1));
						c_bean.setPass(rs.getString(2));
						c_bean.setFname(rs.getString(3));
						c_bean.setLname(rs.getString(4));
						c_bean.setAddr(rs.getString(5));
						c_bean.setMailId(rs.getString(6));
						c_bean.setMobile(rs.getString(7));
					}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return c_bean;
	}
}
