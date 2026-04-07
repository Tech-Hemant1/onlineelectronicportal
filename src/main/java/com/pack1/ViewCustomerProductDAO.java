package com.pack1;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class ViewCustomerProductDAO {
	
ArrayList<ProductBean> al=new ArrayList<ProductBean>();
	
	public ArrayList<ProductBean> retrieveProduct(){
		try {
			
			Connection con=DBConnect.connect();
			PreparedStatement pstmt=con.prepareStatement("select * from mydb2pm.product12");
			ResultSet rs=pstmt.executeQuery();
			while(rs.next()) {
				ProductBean pb1=new ProductBean();
				
				pb1.setpCode(rs.getString(1));
				pb1.setpName(rs.getString(2));
				pb1.setpCompany(rs.getString(3));
				pb1.setpPrice(rs.getString(4));
				pb1.setpQty(rs.getString(5));
				al.add(pb1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return al;
	}
}


