package com.onvs.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection{
	
	private static Connection con;
	
	

	public static Connection getConnection(){
		
		
			if(con==null) {
										
				try {
					Class.forName("com.mysql.jdbc.Driver");
					con=DriverManager.getConnection("jdbc:mysql://localhost:3306/OnlinePollingSystem","root","Homagama502");
				} catch (SQLException | ClassNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		
		return con;
	}
}
