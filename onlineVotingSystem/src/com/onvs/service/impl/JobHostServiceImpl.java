

package com.onvs.service.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.mysql.cj.xdevapi.PreparableStatement;
import com.onvs.model.User;

import com.onvs.model.JobHost;
import com.onvs.service.JobHostService;
import com.onvs.service.UserService;
import com.onvs.util.DBConnection;

import com.onvs.servlet.AddUserServlet;

public class JobHostServiceImpl  implements JobHostService{
	
	
	public static Connection con;
	
	public JobHostServiceImpl() {
		
		
		con= DBConnection.getConnection();
		
	};
	
	

	@Override
	public boolean addNewJobHost(JobHost can1) throws SQLException {
		// TODO Auto-generated method stub
		
		String sql="INSERT INTO JobHost VALUES (?,?,?,?,?,?,?)";
		
		PreparedStatement stm1=con.prepareStatement(sql);
		
		System.out.println("Add karanna awa");
		
		stm1.setObject(1, can1.getCompanyName());
		stm1.setObject(4, can1.getAddress());
		stm1.setObject(2, can1.getEmail());
		stm1.setObject(5, can1.getWebsite());
		stm1.setObject(3, can1.getTel());
		stm1.setObject(6, can1.getNote());
		stm1.setObject(7, can1.getPassword());
		
		

		int q = stm1.executeUpdate();
		
		return false;
	}

	public boolean deleteCandidate(String id) throws SQLException {
		
		String sql="Delete From JobHost where Email='"+id+"'";
		Statement stm= con.createStatement();
		
		return stm.executeUpdate(sql)>0;
	}



	@Override
	public JobHost getJobHostDetails(String id) throws SQLException {
		// TODO Auto-generated method stub
		
		String sql="SELECT * from JobHost where Email ='"+id+"'";
		Statement stm= con.createStatement();
		ResultSet rlt = stm.executeQuery(sql);
		
		
		ArrayList<User> candList = new ArrayList<User>();
		JobHost cand= new JobHost();
		
		
		while(rlt.next()) {
			
			
			
			cand.setAddress(rlt.getString("address"));
			cand.setEmail(rlt.getString("Email"));
			cand.setCompanyName(rlt.getString("CompanyName"));
			cand.setWebsite(rlt.getString("Web"));
			cand.setNote(rlt.getString("note"));
			cand.setTel(rlt.getString("Tel"));
			cand.setPassword(rlt.getString("password"));
			
			
			
		
		
	}
		return cand;
		
	}



	@Override
	public boolean UpdateJobHost(JobHost can1) throws SQLException {
		
		String sql="Update JobHost set password='"+can1.getPassword()+"' ,CompanyName='"+can1.getCompanyName()+"' , address='"+can1.getAddress()+"', tel='"+can1.getTel()+"' , Web='"+can1.getWebsite()+"' , note='"+can1.getNote()+"' where Email='"+can1.getEmail()+"'" ;
		
		
		Statement stm= con.createStatement();
		
		return stm.executeUpdate(sql)>0;
	}



	@Override
	public boolean deleteJobHost(String id) throws SQLException {
		// TODO Auto-generated method stub
		return false;
	}
}
