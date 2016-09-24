package com.fruit.model;

import java.util.Date;

public class Dept {
    private Short deptId;

    private String deptName;

    private Date establishDate;

    private String isValid;

    public Short getDeptId() {
        return deptId;
    }

    public void setDeptId(Short deptId) {
        this.deptId = deptId;
    }

    public String getDeptName() {
        return deptName;
    }

    public void setDeptName(String deptName) {
        this.deptName = deptName == null ? null : deptName.trim();
    }

    public Date getEstablishDate() {
        return establishDate;
    }

    public void setEstablishDate(Date establishDate) {
        this.establishDate = establishDate;
    }

    public String getIsValid() {
        return isValid;
    }

    public void setIsValid(String isValid) {
        this.isValid = isValid == null ? null : isValid.trim();
    }
}