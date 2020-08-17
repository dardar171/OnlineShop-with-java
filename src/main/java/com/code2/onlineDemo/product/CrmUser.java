package com.code2.onlineDemo.product;

import javax.persistence.CascadeType;
import javax.persistence.OneToOne;


public class CrmUser {

	private String userName;

	private String password;

	
	
	
	public CrmUser() {

	}

	public CrmUser(String userName, String password) {
		super();
		this.userName = userName;
		this.password = password;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

}
