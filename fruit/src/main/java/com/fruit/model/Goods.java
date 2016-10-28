package com.fruit.model;

import java.util.Date;

public class Goods {
    private Long goodsId;

    private String goodsName;

    private String producingArea;

    private Long marketPrice;
    
    private Long sellPrice;

    private String description;
    
    private String goodsImageUrl;

    private String tag;

    private Long goodsTypeId;

    private Byte goodsCategory;

    private Long employeeId;

    private Byte goodsStatus;

    private Date putawayTime;

    private Date soldOutTime;

    private Date createTime;

    private String remark;

    public Long getGoodsId() {
        return goodsId;
    }

    public void setGoodsId(Long goodsId) {
        this.goodsId = goodsId;
    }

    public String getGoodsName() {
        return goodsName;
    }

    public void setGoodsName(String goodsName) {
        this.goodsName = goodsName == null ? null : goodsName.trim();
    }

    public String getProducingArea() {
        return producingArea;
    }

    public void setProducingArea(String producingArea) {
        this.producingArea = producingArea == null ? null : producingArea.trim();
    }

    public Long getMarketPrice() {
		return marketPrice;
	}

	public void setMarketPrice(Long marketPrice) {
		this.marketPrice = marketPrice;
	}

	public Long getSellPrice() {
		return sellPrice;
	}

	public void setSellPrice(Long sellPrice) {
		this.sellPrice = sellPrice;
	}

	public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description == null ? null : description.trim();
    }

    public String getGoodsImageUrl() {
		return goodsImageUrl;
	}

	public void setGoodsImageUrl(String goodsImageUrl) {
		this.goodsImageUrl = goodsImageUrl;
	}

	public String getTag() {
        return tag;
    }

    public void setTag(String tag) {
        this.tag = tag == null ? null : tag.trim();
    }

    public Long getGoodsTypeId() {
        return goodsTypeId;
    }

    public void setGoodsTypeId(Long goodsTypeId) {
        this.goodsTypeId = goodsTypeId;
    }

    public Byte getGoodsCategory() {
        return goodsCategory;
    }

    public void setGoodsCategory(Byte goodsCategory) {
        this.goodsCategory = goodsCategory;
    }

    public Long getEmployeeId() {
        return employeeId;
    }

    public void setEmployeeId(Long employeeId) {
        this.employeeId = employeeId;
    }

    public Byte getGoodsStatus() {
        return goodsStatus;
    }

    public void setGoodsStatus(Byte goodsStatus) {
        this.goodsStatus = goodsStatus;
    }

    public Date getPutawayTime() {
        return putawayTime;
    }

    public void setPutawayTime(Date putawayTime) {
        this.putawayTime = putawayTime;
    }

    public Date getSoldOutTime() {
        return soldOutTime;
    }

    public void setSoldOutTime(Date soldOutTime) {
        this.soldOutTime = soldOutTime;
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