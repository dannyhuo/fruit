package com.fruit.model.vo;

import java.util.List;

import com.fruit.enu.Enums.ORDER_STATUS;
import com.fruit.model.DeliveryAddress;
import com.fruit.model.FruitOrder;

public class FruitOrderVo extends FruitOrder{

	private List<FruitOrderDetailVo> orderDetails;
	
	private DeliveryAddress deliveryAddress;

	public List<FruitOrderDetailVo> getOrderDetails() {
		return orderDetails;
	}

	public void setOrderDetails(List<FruitOrderDetailVo> orderDetails) {
		this.orderDetails = orderDetails;
	}
	
	public String getStatusDisplay(){
		return ORDER_STATUS.getCnName(this.getStatus());
	}

	public DeliveryAddress getDeliveryAddress() {
		return deliveryAddress;
	}

	public void setDeliveryAddress(DeliveryAddress deliveryAddress) {
		this.deliveryAddress = deliveryAddress;
	}
	
	public String getStatusName(){
		return ORDER_STATUS.getCnName(this.getStatus());
	}
	
}
