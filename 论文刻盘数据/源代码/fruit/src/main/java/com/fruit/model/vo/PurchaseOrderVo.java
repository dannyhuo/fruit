package com.fruit.model.vo;

import java.util.List;

import com.fruit.model.PurchaseOrder;

public class PurchaseOrderVo extends PurchaseOrder{

	private String parchaseName;
	
	private List<PurchaseOrderDetailVo> purchaseOrderDetails;
	
	private String purchaseOrderDetailsJson;

	public String getParchaseName() {
		return parchaseName;
	}

	public void setParchaseName(String parchaseName) {
		this.parchaseName = parchaseName;
	}

	public List<PurchaseOrderDetailVo> getPurchaseOrderDetails() {
		return purchaseOrderDetails;
	}

	public void setPurchaseOrderDetails(List<PurchaseOrderDetailVo> purchaseOrderDetails) {
		this.purchaseOrderDetails = purchaseOrderDetails;
	}

	public String getPurchaseOrderDetailsJson() {
		return purchaseOrderDetailsJson;
	}

	public void setPurchaseOrderDetailsJson(String purchaseOrderDetailsJson) {
		this.purchaseOrderDetailsJson = purchaseOrderDetailsJson;
	}
	
}
