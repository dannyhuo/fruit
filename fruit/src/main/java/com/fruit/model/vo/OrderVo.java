package com.fruit.model.vo;

import java.util.List;

import com.fruit.model.Order;
import com.fruit.model.OrderDetail;

public class OrderVo extends Order{

	private List<OrderDetail> orderDetails;

	public List<OrderDetail> getOrderDetails() {
		return orderDetails;
	}

	public void setOrderDetails(List<OrderDetail> orderDetails) {
		this.orderDetails = orderDetails;
	}
}
