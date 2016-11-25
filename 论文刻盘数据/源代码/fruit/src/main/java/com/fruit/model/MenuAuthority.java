package com.fruit.model;

import java.util.Date;

public class MenuAuthority {
    private Long menuAuthorityId;

    private Long backMenuId;

    private Byte role;

    private Date createTime;

    private String isValid;

    private String remark;

    public Long getMenuAuthorityId() {
        return menuAuthorityId;
    }

    public void setMenuAuthorityId(Long menuAuthorityId) {
        this.menuAuthorityId = menuAuthorityId;
    }

    public Long getBackMenuId() {
        return backMenuId;
    }

    public void setBackMenuId(Long backMenuId) {
        this.backMenuId = backMenuId;
    }

    public Byte getRole() {
        return role;
    }

    public void setRole(Byte role) {
        this.role = role;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public String getIsValid() {
        return isValid;
    }

    public void setIsValid(String isValid) {
        this.isValid = isValid == null ? null : isValid.trim();
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }
}