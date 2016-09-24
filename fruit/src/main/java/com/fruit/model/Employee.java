package com.fruit.model;

import java.math.BigDecimal;
import java.util.Date;

public class Employee {
    private Long employeeId;

    private String loginName;

    private String password;

    private String realName;

    private String gender;

    private Date birthday;

    private Short dept;

    private String position;

    private String rank;

    private BigDecimal monthlyPay;

    private Date hiredTime;

    private Short hireYear;

    private Short employeeStatus;

    public Long getEmployeeId() {
        return employeeId;
    }

    public void setEmployeeId(Long employeeId) {
        this.employeeId = employeeId;
    }

    public String getLoginName() {
        return loginName;
    }

    public void setLoginName(String loginName) {
        this.loginName = loginName == null ? null : loginName.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public String getRealName() {
        return realName;
    }

    public void setRealName(String realName) {
        this.realName = realName == null ? null : realName.trim();
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender == null ? null : gender.trim();
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public Short getDept() {
        return dept;
    }

    public void setDept(Short dept) {
        this.dept = dept;
    }

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position == null ? null : position.trim();
    }

    public String getRank() {
        return rank;
    }

    public void setRank(String rank) {
        this.rank = rank == null ? null : rank.trim();
    }

    public BigDecimal getMonthlyPay() {
        return monthlyPay;
    }

    public void setMonthlyPay(BigDecimal monthlyPay) {
        this.monthlyPay = monthlyPay;
    }

    public Date getHiredTime() {
        return hiredTime;
    }

    public void setHiredTime(Date hiredTime) {
        this.hiredTime = hiredTime;
    }

    public Short getHireYear() {
        return hireYear;
    }

    public void setHireYear(Short hireYear) {
        this.hireYear = hireYear;
    }

    public Short getEmployeeStatus() {
        return employeeStatus;
    }

    public void setEmployeeStatus(Short employeeStatus) {
        this.employeeStatus = employeeStatus;
    }
}