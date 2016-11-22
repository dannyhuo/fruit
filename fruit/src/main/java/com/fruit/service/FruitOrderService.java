package com.fruit.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fruit.dao.mysql.FruitOrderDetailMapper;
import com.fruit.dao.mysql.FruitOrderMapper;
import com.fruit.dao.mysql.ShoppingCartMapper;
import com.fruit.enu.Enums.SHOPPING_CART_STATUS;
import com.fruit.model.FruitOrder;
import com.fruit.model.FruitOrderDetail;
import com.fruit.model.ShoppingCart;
import com.fruit.model.vo.FruitOrderVo;

@Service("orderService")
public class FruitOrderService {
	
	@Autowired
	private FruitOrderMapper orderMapper;
	
	@Autowired
	private FruitOrderDetailMapper orderDetailMapper;
	
	@Autowired
	private ShoppingCartMapper shoppingCartMapper;
	
	public void saveOrder(FruitOrderVo orderVo){
		if(null != orderVo){
			orderMapper.insertSelective(orderVo);
			if(null != orderVo.getOrderDetails() && 
					orderVo.getOrderDetails().size() > 0){
				for (FruitOrderDetail orderDetail : orderVo.getOrderDetails()) {
					orderDetail.setOrderId(orderVo.getOrderId());
					orderDetailMapper.insertSelective(orderDetail);
					
					//将购物车商品的状态设置为已购买
					ShoppingCart sc = new ShoppingCart();
					sc.setGoodsId(orderDetail.getGoodsId());
					sc.setCustomerId(orderVo.getCustomerId());
					sc.setStatus(SHOPPING_CART_STATUS.BOUGHT.getCode());
					shoppingCartMapper.updateByCustomerAndGoodsIdSelective(sc);
					
					//减少可售库存
					
				}
			}
		}
	}
	
	/**
	 * 根据订单ID查询订单
	 * @param orderId
	 * @return
	 */
	public FruitOrder selectByPrimaryKey(Long orderId){
		return orderMapper.selectByPrimaryKey(orderId);
	}
	
	/**
	 * 根据条件查询订单
	 * @param params
	 * @return
	 */
	public List<FruitOrderVo> querySelective(Map<String, Object> params){
		return orderMapper.querySelective(params);
	}
}
