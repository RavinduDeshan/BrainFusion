package com.onvs.model;

public class Admin {

	
	private String adminId;
	private String pass;
	private String name;
	private String email;
	private String tel;
	
	
	
	/**
	 * @param adminId
	 * @param pass
	 * @param name
	 * @param email
	 * @param tel
	 */
	public Admin(String adminId, String pass, String name, String email, String tel) {
		super();
		this.adminId = adminId;
		this.pass = pass;
		this.name = name;
		this.email = email;
		this.tel = tel;
	}


	/**
	 * @return the adminId
	 */
	public String getAdminId() {
		return adminId;
	}


	/**
	 * @param adminId the adminId to set
	 */
	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}


	/**
	 * @return the pass
	 */
	public String getPass() {
		return pass;
	}


	/**
	 * @param pass the pass to set
	 */
	public void setPass(String pass) {
		this.pass = pass;
	}


	/**
	 * @return the name
	 */
	public String getName() {
		return name;
	}


	/**
	 * @param name the name to set
	 */
	public void setName(String name) {
		this.name = name;
	}


	/**
	 * @return the email
	 */
	public String getEmail() {
		return email;
	}


	/**
	 * @param email the email to set
	 */
	public void setEmail(String email) {
		this.email = email;
	}


	/**
	 * @return the tel
	 */
	public String getTel() {
		return tel;
	}


	/**
	 * @param tel the tel to set
	 */
	public void setTel(String tel) {
		this.tel = tel;
	}
	
	
	
	


	
	
	
}
