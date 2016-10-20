package com.fruit.model;

import java.util.Date;

public class Repostory {
    private Long repostoryId;

    private String repostoryName;

    private String repostoryArea;

    private String repostoryProvince;

    private String repostoryCity;

    private String repostoryAddress;

    private Long repostoryAcreage;

    private Long employeeId;

    private Date startUsingDate;

    private Date createTime;

    private String remark;

    public Long getRepostoryId() {
        return repostoryId;
    }

    public void setRepostoryId(Long repostoryId) {
        this.repostoryId = repostoryId;
    }

    public String getRepostoryName() {
        return repostoryName;
    }

    public void setRepostoryName(String repostoryName) {
        this.repostoryName = repostoryName == null ? null : repostoryName.trim();
    }

    public String getRepostoryArea() {
        return repostoryArea;
    }

    public void setRepostoryArea(String repostoryArea) {
        this.repostoryArea = repostoryArea == null ? null : repostoryArea.trim();
    }

    public String getRepostoryProvince() {
        return repostoryProvince;
    }

    public void setRepostoryProvince(String repostoryProvince) {
        this.repostoryProvince = repostoryProvince == null ? null : repostoryProvince.trim();
    }

    public String getRepostoryCity() {
        return repostoryCity;
    }

    public void setRepostoryCity(String repostoryCity) {
        this.repostoryCity = repostoryCity == null ? null : repostoryCity.trim();
    }

    public String getRepostoryAddress() {
        return repostoryAddress;
    }

    public void setRepostoryAddress(String repostoryAddress) {
        this.repostoryAddress = repostoryAddress == null ? null : repostoryAddress.trim();
    }

    public Long getRepostoryAcreage() {
        return repostoryAcreage;
    }

    public void setRepostoryAcreage(Long repostoryAcreage) {
        this.repostoryAcreage = repostoryAcreage;
    }

    public Long getEmployeeId() {
        return employeeId;
    }

    public void setEmployeeId(Long employeeId) {
        this.employeeId = employeeId;
    }

    public Date getStartUsingDate() {
        return startUsingDate;
    }

    public void setStartUsingDate(Date startUsingDate) {
        this.startUsingDate = startUsingDate;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }
}