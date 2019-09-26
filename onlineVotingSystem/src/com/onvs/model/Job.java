package com.onvs.model;

public class Job {
	
	private String title;
	private String code;
	private String email;
	private String Tel;
	private String web;
	private String type;
	private String genderType;
	private String note;
	private String company;
	private String companyNote;
	private String cemail;
	

	public Job() {
		// TODO Auto-generated constructor stub
	}


	public Job(String title, String code, String email, String tel, String web, String type, String genderType,
			String note, String company, String companyNote,String cemail) {
		super();
		this.title = title;
		this.code = code;
		this.email = email;
		Tel = tel;
		this.web = web;
		this.type = type;
		this.genderType = genderType;
		this.note = note;
		this.company = company;
		this.companyNote = companyNote;
		this.cemail = cemail;
	}


	public String getCemail() {
		return cemail;
	}


	public void setCemail(String cemail) {
		this.cemail = cemail;
	}


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public String getCode() {
		return code;
	}


	public void setCode(String code) {
		this.code = code;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getTel() {
		return Tel;
	}


	public void setTel(String tel) {
		Tel = tel;
	}


	public String getWeb() {
		return web;
	}


	public void setWeb(String web) {
		this.web = web;
	}


	public String getType() {
		return type;
	}


	public void setType(String type) {
		this.type = type;
	}


	public String getGenderType() {
		return genderType;
	}


	public void setGenderType(String genderType) {
		this.genderType = genderType;
	}


	public String getNote() {
		return note;
	}


	public void setNote(String note) {
		this.note = note;
	}


	public String getCompany() {
		return company;
	}


	public void setCompany(String company) {
		this.company = company;
	}


	public String getCompanyNote() {
		return companyNote;
	}


	public void setCompanyNote(String companyNote) {
		this.companyNote = companyNote;
	}

	
	
}
