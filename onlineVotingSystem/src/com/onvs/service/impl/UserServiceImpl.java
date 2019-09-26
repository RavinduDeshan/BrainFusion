package com.onvs.service.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.mysql.cj.xdevapi.PreparableStatement;
import com.onvs.model.User;

import com.onvs.service.UserService;
import com.onvs.util.DBConnection;

import com.onvs.servlet.AddUserServlet;

public class UserServiceImpl implements UserService{
	
	
	public static Connection con;
	
	public UserServiceImpl() {
		
		
		con= DBConnection.getConnection();
		
	};
	
	

	@Override
	public boolean addNewUser(User can1) throws SQLException {
		// TODO Auto-generated method stub
		
		String sql="INSERT INTO User VALUES (?,?,?,?,?,?,?,?,?,?,?)";
		
		PreparedStatement stm1=con.prepareStatement(sql);
		
		System.out.println("Add karanna awa");
		
		stm1.setObject(1,can1.getNIC());
		stm1.setObject(2, can1.getfName());
		stm1.setObject(3, can1.getiName());
		stm1.setObject(4, can1.getAddress());
		stm1.setObject(5, can1.getEmail());
		stm1.setObject(6, can1.getTel());
		stm1.setObject(7, can1.getNote());
		stm1.setObject(8, can1.getGender());
		stm1.setObject(9, can1.getUni());
		stm1.setObject(10, can1.getPassword());
		stm1.setObject(11, can1.getSchool());
		
		

		int q = stm1.executeUpdate();
		
		return false;
	}

	public boolean deleteCandidate(String id) throws SQLException {
		
		String sql="Delete From User where NIC='"+id+"'";
		Statement stm= con.createStatement();
		
		return stm.executeUpdate(sql)>0;
	}



	@Override
	public User getUserDetails(String id) throws SQLException {
		// TODO Auto-generated method stub
		
		String sql="SELECT * from User where NIC ='"+id+"'";
		Statement stm= con.createStatement();
		ResultSet rlt = stm.executeQuery(sql);
		
		
		ArrayList<User> candList = new ArrayList<User>();
		User cand= new User();
		
		
		while(rlt.next()) {
			
			
			
			cand.setAddress(rlt.getString("address"));
			cand.setSchool(rlt.getString("school"));
			cand.setEmail(rlt.getString("email"));
			cand.setfName(rlt.getString("f_name"));
			cand.setGender(rlt.getString("gender"));
			cand.setiName(rlt.getString("i_name"));
			cand.setNIC(rlt.getString("NIC"));
			cand.setNote(rlt.getString("note"));
			cand.setUni(rlt.getString("uni"));
			cand.setTel(rlt.getString("tel"));
			cand.setPassword(rlt.getString("password"));
			
			
		
		
	}
		return cand;
		
	}



	@Override
	public boolean UpdateUser(User can1) throws SQLException {
		
		String sql="Update User set f_name='"+can1.getfName()+"', i_name='"+can1.getiName()+"' , address='"+can1.getAddress()+"' , email='"+can1.getEmail()+"', tel='"+can1.getTel()+"' , school='"+can1.getSchool()+"' , uni='"+can1.getUni()+"', gender='"+can1.getGender()+"' , note='"+can1.getNote()+"' where NIC='"+can1.getNIC()+"', password='"+can1.getPassword()+"'" ;
		
		
		Statement stm= con.createStatement();
		
		return stm.executeUpdate(sql)>0;
	}



	@Override
	public boolean deleteUser(String id) throws SQLException {
		// TODO Auto-generated method stub
		return false;
	}
}
