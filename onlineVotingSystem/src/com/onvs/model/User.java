package com.onvs.model;

public class User {


	private String NIC;
	private String fName;
	private String iName;
	private String email;
	private String address;
	private String tel;
	private String school;
	private String uni;
	private String gender;
	private String note;
	private String password;
	
	/**
	 * @param nIC
	 * @param fName
	 * @param iName
	 * @param email
	 * @param tel
	 * @param elect
	 * @param party
	 */

	
	
	
	/**
	 * @return the nIC
	 */
	public String getNIC() {
		return NIC;
	}
	/**
	 * @param nIC
	 * @param fName
	 * @param iName
	 * @param email
	 * @param address
	 * @param tel
	 * @param elect
	 * @param party
	 * @param gender
	 * @param note
	 */
	
	public User() {};
	
	public User(String nIC, String fName, String iName, String email, String address, String tel, String school,
			String uni, String gender, String note, String password) {
		super();
		NIC = nIC;
		this.fName = fName;
		this.iName = iName;
		this.email = email;
		this.address = address;
		this.tel = tel;
		this.school = school;
		this.uni = uni;
		this.gender = gender;
		this.note = note;
		this.password=password;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	/**
	 * @param nIC the nIC to set
	 */
	public void setNIC(String nIC) {
		NIC = nIC;
	}
	/**
	 * @return the fName
	 */
	public String getfName() {
		return fName;
	}
	/**
	 * @param fName the fName to set
	 */
	public void setfName(String fName) {
		this.fName = fName;
	}
	/**
	 * @return the iName
	 */
	public String getiName() {
		return iName;
	}
	/**
	 * @param iName the iName to set
	 */
	public void setiName(String iName) {
		this.iName = iName;
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
	/**
	 * @return the elect
	 */
	public String getSchool() {
		return school;
	}
	/**
	 * @param elect the elect to set
	 */
	public void setSchool(String School) {
		this.school = School;
	}
	/**
	 * @return the party
	 */
	public String getUni() {
		return uni;
	}
	/**
	 * @param party the party to set
	 */
	public void setUni(String Uni) {
		this.uni = Uni;
	}
	/**
	 * @return the address
	 */
	public String getAddress() {
		return address;
	}
	/**
	 * @param address the address to set
	 */
	public void setAddress(String address) {
		this.address = address;
	}
	/**
	 * @return the gender
	 */
	public String getGender() {
		return gender;
	}
	/**
	 * @param gender the gender to set
	 */
	public void setGender(String gender) {
		this.gender = gender;
	}
	/**
	 * @return the note
	 */
	public String getNote() {
		return note;
	}
	/**
	 * @param note the note to set
	 */
	public void setNote(String note) {
		this.note = note;
	}
	
	
	
	
	
	
	
}
