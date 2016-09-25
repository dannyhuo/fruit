package com.fruit.model.vo;

import com.fruit.model.Customer;

public class CustomerVo extends Customer {
	private String confirmPassword;

	public String getConfirmPassword() {
		return confirmPassword;
	}

	public void setConfirmPassword(String confirmPassword) {
		this.confirmPassword = confirmPassword;
	}
	
}
