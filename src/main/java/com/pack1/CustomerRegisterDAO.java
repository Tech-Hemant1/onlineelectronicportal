package com.pack1;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class CustomerRegisterDAO {

	int insertData(CustomerBean cb) {
		int rowCount=0;
		try {
			Connection con=DBConnect.connect();
			
			PreparedStatement pstmt=con.prepareStatement("insert into mydb2pm.customer values(?,?,?,?,?,?,?)");
			
			pstmt.setString(1, cb.getUsername());
			pstmt.setString(2, cb.getPass());
			pstmt.setString(3, cb.getFname());
			pstmt.setString(4, cb.getLname());
			pstmt.setString(5, cb.getAddr());
			pstmt.setString(6, cb.getMailId());
			pstmt.setString(7, cb.getMobile());
			rowCount=pstmt.executeUpdate();		
		} catch (Exception e) {
			e.printStackTrace();
		}
		return rowCount;
	}
}
//public CustomerBean check_login(String username,String password) {
//	CustomerBean c_bean=null;
//	try {
//		Connection con=DBConnect.connect();
//		PreparedStatement pstmt=con.prepareStatement("insert into mydb2pm.customer values(?,?,?,?,?,?,?)");
//		pstmt.setString(1, username);
//		pstmt.setString(2, password);
//		ResultSet rs=pstmt.executeQuery();
//		if(rs.next()) {
//			CustomerBean bean=new CustomerBean();
//			bean.setUsername(rs.getString(1));
//			bean.setPass(rs.getString(2));
//			bean.setFname(rs.getString(3));
//			bean.setLname(rs.getString(4));
//			bean.setAddr(rs.getString(5));
//			bean.setMailId(rs.getString(6));
//			bean.setMobile(rs.getString(7));
//		}
//	} catch (Exception e) {
//		e.printStackTrace();
//	}	
//	return c_bean;
//}