package com.onvs.model;

public class JobHost {
	
	
	private String companyName;
	private String Email;
	private String Website;
	private String Tel;
	private String note;
	private String password;
	private String address;
	

	public JobHost() {
		// TODO Auto-generated constructor stub
	}

	

	public JobHost(String companyName, String email, String website, String tel, String note, String password,
			String address) {
		super();
		this.companyName = companyName;
		Email = email;
		Website = website;
		Tel = tel;
		this.note = note;
		this.password = password;
		this.address = address;
	}



	public String getCompanyName() {
		return companyName;
	}


	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}


	public String getEmail() {
		return Email;
	}


	public void setEmail(String email) {
		Email = email;
	}


	public String getWebsite() {
		return Website;
	}


	public void setWebsite(String website) {
		Website = website;
	}


	public String getTel() {
		return Tel;
	}


	public void setTel(String tel) {
		Tel = tel;
	}


	public String getNote() {
		return note;
	}


	public void setNote(String note) {
		this.note = note;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}


	public String getAddress() {
		return address;
	}


	public void setAddress(String address) {
		this.address = address;
	}

}
