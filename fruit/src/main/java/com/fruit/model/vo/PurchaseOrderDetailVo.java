package com.fruit.model.vo;

import com.fruit.enu.Enums.PURCHASE_STATUS;
import com.fruit.model.PurchaseOrderDetail;

public class PurchaseOrderDetailVo extends PurchaseOrderDetail{
	
	private String goodsName;
	
	private String goodsImageUrl;

	public String getGoodsName() {
		return goodsName;
	}

	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}

	public String getGoodsImageUrl() {
		return goodsImageUrl;
	}

	public void setGoodsImageUrl(String goodsImageUrl) {
		this.goodsImageUrl = goodsImageUrl;
	}
	
	public String getStatusCnName(){
		return PURCHASE_STATUS.getCnName(this.getStatus());
	}

}
