package com.fruit.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fruit.dao.mysql.OrderDetailMapper;
import com.fruit.dao.mysql.OrderMapper;
import com.fruit.dao.mysql.ShoppingCartMapper;
import com.fruit.model.Order;
import com.fruit.model.OrderDetail;
import com.fruit.model.vo.OrderVo;

@Service("orderService")
public class OrderService {
	
	@Autowired
	private OrderMapper orderMapper;
	
	@Autowired
	private OrderDetailMapper orderDetailMapper;
	
	@Autowired
	private ShoppingCartMapper shoppingCartMapper;
	
	public void saveOrder(OrderVo orderVo){
		if(null != orderVo){
			int rflectRows = orderMapper.insertSelective((Order)orderVo);
			if(rflectRows > 0 && null != orderVo.getOrderDetails() && 
					orderVo.getOrderDetails().size() > 0){
				for (OrderDetail orderDetail : orderVo.getOrderDetails()) {
					orderDetail.setOrderId(orderVo.getOrderId());
					orderDetailMapper.insertSelective(orderDetail);
				}
			}
		}
	}
}
