package com.fruit.model.vo;

import com.fruit.model.FruitOrderDetail;

public class FruitOrderDetailVo extends FruitOrderDetail{
	
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
	
}
