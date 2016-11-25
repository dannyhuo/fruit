package com.fruit.model.vo;

import com.fruit.model.GoodsInventory;

public class GoodsInventoryVo extends GoodsInventory{
	
	private Long purchaseOrderDetailId;
	
	private Long orderDetailId;
	
	public Long getPurchaseOrderDetailId() {
		return purchaseOrderDetailId;
	}

	public void setPurchaseOrderDetailId(Long purchaseOrderDetailId) {
		this.purchaseOrderDetailId = purchaseOrderDetailId;
	}

	public Long getOrderDetailId() {
		return orderDetailId;
	}

	public void setOrderDetailId(Long orderDetailId) {
		this.orderDetailId = orderDetailId;
	}
	
}
