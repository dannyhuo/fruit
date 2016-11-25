package com.fruit.model;

import java.util.Date;

public class GoodsType {
    private Long goodsTypeId;

    private String goodsTypeName;

    private Byte goodsCategory;

    private Date createTime;

    private String remark;

    public Long getGoodsTypeId() {
        return goodsTypeId;
    }

    public void setGoodsTypeId(Long goodsTypeId) {
        this.goodsTypeId = goodsTypeId;
    }

    public String getGoodsTypeName() {
        return goodsTypeName;
    }

    public void setGoodsTypeName(String goodsTypeName) {
        this.goodsTypeName = goodsTypeName == null ? null : goodsTypeName.trim();
    }

    public Byte getGoodsCategory() {
        return goodsCategory;
    }

    public void setGoodsCategory(Byte goodsCategory) {
        this.goodsCategory = goodsCategory;
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