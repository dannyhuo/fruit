package com.fruit.model.vo;

import com.fruit.enu.Enums.EMPLOYEE_ROLE;
import com.fruit.enu.Enums.EMPLOYEE_STATUS;
import com.fruit.model.Employee;

public class EmployeeVo extends Employee {
	private String confirmPassword;
	

	private boolean loginSuccess;
	
	private String loginMessage;
	
	
	public String getConfirmPassword() {
		return confirmPassword;
	}

	public void setConfirmPassword(String confirmPassword) {
		this.confirmPassword = confirmPassword;
	}

	public boolean isLoginSuccess() {
		return loginSuccess;
	}

	public void setLoginSuccess(boolean loginSuccess) {
		this.loginSuccess = loginSuccess;
	}

	public String getLoginMessage() {
		return loginMessage;
	}

	public void setLoginMessage(String loginMessage) {
		this.loginMessage = loginMessage;
	}
	
	public String getRoleName(){
		return EMPLOYEE_ROLE.getCnName(this.getRole());
	}
	
	public String getEmployeeStatusName(){
		return EMPLOYEE_STATUS.getCnName(this.getEmployeeStatus());
	}
}
