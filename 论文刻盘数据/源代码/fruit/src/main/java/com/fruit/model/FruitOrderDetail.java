package com.fruit.model;

import java.util.Date;

public class FruitOrderDetail {
    private Long orderDetailId;

    private Long orderId;

    private Long goodsId;

    private Short quantity;

    private Long totalPay;

    private Long totalOughtPay;

    private Date createTime;
    
    private Byte status;

    private String remark;

    public Long getOrderDetailId() {
        return orderDetailId;
    }

    public void setOrderDetailId(Long orderDetailId) {
        this.orderDetailId = orderDetailId;
    }

    public Long getOrderId() {
        return orderId;
    }

    public void setOrderId(Long orderId) {
        this.orderId = orderId;
    }

    public Long getGoodsId() {
        return goodsId;
    }

    public void setGoodsId(Long goodsId) {
        this.goodsId = goodsId;
    }

    public Short getQuantity() {
        return quantity;
    }

    public void setQuantity(Short quantity) {
        this.quantity = quantity;
    }

    public Long getTotalPay() {
        return totalPay;
    }

    public void setTotalPay(Long totalPay) {
        this.totalPay = totalPay;
    }

    public Long getTotalOughtPay() {
        return totalOughtPay;
    }

    public void setTotalOughtPay(Long totalOughtPay) {
        this.totalOughtPay = totalOughtPay;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Byte getStatus() {
		return status;
	}

	public void setStatus(Byte status) {
		this.status = status;
	}

	public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }
}