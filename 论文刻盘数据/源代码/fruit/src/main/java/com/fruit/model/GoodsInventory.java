package com.fruit.model;

import java.util.Date;

public class GoodsInventory {
    private Long goodsInventoryId;

    private Long goodsId;

    private Long goodsBatchNo;

    private Long repostoryId;

    private Date expiredTime;

    private Short quantity;

    private Short sellingQuantity;

    private Short soldQuantity;

    private Date createTime;

    private String remark;

    public Long getGoodsInventoryId() {
        return goodsInventoryId;
    }

    public void setGoodsInventoryId(Long goodsInventoryId) {
        this.goodsInventoryId = goodsInventoryId;
    }

    public Long getGoodsId() {
        return goodsId;
    }

    public void setGoodsId(Long goodsId) {
        this.goodsId = goodsId;
    }

    public Long getGoodsBatchNo() {
        return goodsBatchNo;
    }

    public void setGoodsBatchNo(Long goodsBatchNo) {
        this.goodsBatchNo = goodsBatchNo;
    }

    public Long getRepostoryId() {
        return repostoryId;
    }

    public void setRepostoryId(Long repostoryId) {
        this.repostoryId = repostoryId;
    }

    public Date getExpiredTime() {
        return expiredTime;
    }

    public void setExpiredTime(Date expiredTime) {
        this.expiredTime = expiredTime;
    }

    public Short getQuantity() {
        return quantity;
    }

    public void setQuantity(Short quantity) {
        this.quantity = quantity;
    }

    public Short getSellingQuantity() {
        return sellingQuantity;
    }

    public void setSellingQuantity(Short sellingQuantity) {
        this.sellingQuantity = sellingQuantity;
    }

    public Short getSoldQuantity() {
        return soldQuantity;
    }

    public void setSoldQuantity(Short soldQuantity) {
        this.soldQuantity = soldQuantity;
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