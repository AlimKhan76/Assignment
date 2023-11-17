package com.web.api.model;

import com.fasterxml.jackson.annotation.JsonProperty;

public class Login {

	@JsonProperty("login_id")
	private String loginId;
	private String password;

	public Login(String loginId, String password) {
		super();
		this.loginId = loginId;
		this.password = password;
	}
	
	
	public String getLoginId() {
		return loginId;
	}

	public void setLoginId(String loginId) {
		this.loginId = loginId;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

}
