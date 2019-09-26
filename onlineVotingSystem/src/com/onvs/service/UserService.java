package com.onvs.service;

import java.sql.SQLException;
import java.util.ArrayList;

import com.onvs.model.User;
import com.onvs.service.impl.UserServiceImpl;

public interface UserService {

	boolean addNewUser(User can1) throws SQLException;



	boolean deleteUser(String id) throws SQLException;



	User getUserDetails(String id) throws SQLException;



	boolean UpdateUser(User can1) throws SQLException;










	
	

	

}
