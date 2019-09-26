package com.onvs.service;





import java.sql.SQLException;
import java.util.ArrayList;

import com.onvs.model.JobHost;
import com.onvs.model.User;


public interface JobHostService {



	boolean addNewJobHost(JobHost can1) throws SQLException;



	boolean deleteJobHost(String id) throws SQLException;



	JobHost getJobHostDetails(String id) throws SQLException;



	boolean UpdateJobHost(JobHost can1) throws SQLException;










	
	

	

}
