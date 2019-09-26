package com.onvs.service.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

import com.onvs.model.Vote;
import com.onvs.service.VoteService;
import com.onvs.util.DBConnection;

public class VoteServiceImpl implements VoteService{
	
	public static Connection con;
	
	
public VoteServiceImpl() {
		
		
		con= DBConnection.getConnection();
		
	};

	@Override
	public boolean addNewVote(Vote votePass) throws SQLException {
		// TODO Auto-generated method stub
		
		
		String sql="INSERT INTO Vote VALUES (?,?,?)";
		
		PreparedStatement stm1=con.prepareStatement(sql);
		
		
		stm1.setObject(1, votePass.getParty());
		stm1.setObject(2, votePass.getCandidate());
		stm1.setObject(3, votePass.getElection());
	

		int q = stm1.executeUpdate();
		
		return false;
	}

	
	

}
