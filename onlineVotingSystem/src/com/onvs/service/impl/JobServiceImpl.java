

package com.onvs.service.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.mysql.cj.xdevapi.PreparableStatement;
import com.onvs.model.User;

import com.onvs.model.Job;
import com.onvs.service.JobService;
import com.onvs.service.UserService;
import com.onvs.util.DBConnection;

import com.onvs.servlet.AddUserServlet;

public class JobServiceImpl  implements JobService{
	
	
	public static Connection con;
	
	public JobServiceImpl() {
		
		
		con= DBConnection.getConnection();
		
	};
	
	

	@Override
	public boolean addNewJob(Job can1) throws SQLException {
		// TODO Auto-generated method stub
		
		String sql="INSERT INTO Job VALUES (?,?,?,?,?,?,?,?,?,?,?)";
		
		PreparedStatement stm1=con.prepareStatement(sql);
		
		System.out.println("Add karanna awa");
		
		stm1.setObject(1, can1.getTitle());
		stm1.setObject(2, can1.getCode());
		stm1.setObject(3, can1.getEmail());
		stm1.setObject(4, can1.getTel());
		stm1.setObject(5, can1.getWeb());
		stm1.setObject(6, can1.getType());
		stm1.setObject(7, can1.getGenderType());
		stm1.setObject(8, can1.getNote());
		stm1.setObject(9, can1.getCompany());
		stm1.setObject(10, can1.getCompanyNote());
		stm1.setObject(11, can1.getCemail());
		

		int q = stm1.executeUpdate();
		
		return false;
	}

	public boolean deleteCandidate(String id) throws SQLException {
		
		String sql="Delete From Job where code='"+id+"'";
		Statement stm= con.createStatement();
		
		return stm.executeUpdate(sql)>0;
	}



	@Override
	public Job getJobDetails(String id) throws SQLException {
		// TODO Auto-generated method stub
		
		String sql="SELECT * from Job where code ='"+id+"'";
		Statement stm= con.createStatement();
		ResultSet rlt = stm.executeQuery(sql);
		
		
		ArrayList<User> candList = new ArrayList<User>();
		Job cand= new Job();
		
		
		while(rlt.next()) {
			
			
			
			cand.setTitle(rlt.getString("title"));
			cand.setEmail(rlt.getString("Email"));
			cand.setCompany(rlt.getString("company"));
			cand.setCompanyNote(rlt.getString("companyNote"));
			cand.setNote(rlt.getString("note"));
			cand.setTel(rlt.getString("Tel"));
			cand.setGenderType(rlt.getString("gender"));
			cand.setCode(rlt.getString("code"));
			cand.setType(rlt.getString("type"));
			cand.setWeb(rlt.getString("web"));
			cand.setCemail(rlt.getString("cemail"));
			
			
		
		
	}
		return cand;
		
	}

    public int getJobCount(String id) throws SQLException {
    	
    	
    	ResultSet rc1 = null;
    	int rowCount1= 0;
    	Statement stat = con.createStatement();
    	String sql="SELECT COUNT(*) AS rowcount1 FROM Job where cemail ='"+id+"'";
    	rc1 = stat.executeQuery(sql);

    	if (rc1.next()) {
    		
    	        rowCount1 = rc1.getInt("rowcount1");
    	        
    	}
    	
    	return rowCount1;
    }

	@Override
	public boolean UpdateJob(Job can1) throws SQLException {
		
		//String sql="Update Job set password='"+can1.getPassword()+"' ,CompanyName='"+can1.getCompanyName()+"' , address='"+can1.getAddress()+"', tel='"+can1.getTel()+"' , Web='"+can1.getWebsite()+"' , note='"+can1.getNote()+"' where code='"+can1.getCode()+"'" ;
		
		
		Statement stm= con.createStatement();
		
		//return stm.executeUpdate(sql)>0;
		//Meyata kalla ayin karanna passe
		return false;
	}



	@Override
	public boolean deleteJob(String id) throws SQLException {
		// TODO Auto-generated method stub
		return false;
	}
}
