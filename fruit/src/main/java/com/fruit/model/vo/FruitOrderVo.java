package com.fruit.model.vo;

import java.util.List;

import com.fruit.enu.Enums.ORDER_STATUS;
import com.fruit.model.FruitOrder;
import com.fruit.model.FruitOrderDetail;

public class FruitOrderVo extends FruitOrder{

	private List<FruitOrderDetail> orderDetails;

	public List<FruitOrderDetail> getOrderDetails() {
		return orderDetails;
	}

	public void setOrderDetails(List<FruitOrderDetail> orderDetails) {
		this.orderDetails = orderDetails;
	}
	
	public String getStatusDisplay(){
		return ORDER_STATUS.getCnName(this.getStatus());
	}
}
