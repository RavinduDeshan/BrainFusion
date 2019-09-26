package com.onvs.service;








import java.sql.SQLException;
import java.util.ArrayList;

import com.onvs.model.Job;
import com.onvs.model.JobHost;
import com.onvs.model.User;


public interface JobService {



	boolean addNewJob(Job can1) throws SQLException;



	boolean deleteJob(String id) throws SQLException;



	Job getJobDetails(String id) throws SQLException;



	boolean UpdateJob(Job can1) throws SQLException;










	
	

	

}
