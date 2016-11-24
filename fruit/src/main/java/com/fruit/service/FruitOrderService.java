package com.fruit.service;

import java.util.HashMap;
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
import com.fruit.model.vo.GoodsInventoryVo;

@Service("orderService")
public class FruitOrderService {
	
	@Autowired
	private FruitOrderMapper orderMapper;
	
	@Autowired
	private FruitOrderDetailMapper orderDetailMapper;
	
	@Autowired
	private ShoppingCartMapper shoppingCartMapper;
	
	@Autowired
	private GoodsInventoryService goodsInventoryService;
	
	
	public void saveOrder(FruitOrderVo orderVo){
		if(null != orderVo){
			orderMapper.insertSelective(orderVo);
			if(null != orderVo.getOrderDetails() && 
					orderVo.getOrderDetails().size() > 0){
				for (FruitOrderDetail orderDetail : orderVo.getOrderDetails()) {
					orderDetail.setOrderId(orderVo.getOrderId());
					
					//减少可售库存
					Map<String, Object> params = new HashMap<>();
					params.put("goodsId", orderDetail.getGoodsId());
					//params.put("city", orderVo.getDeliveryAddress().getCity());
					List<GoodsInventoryVo> inventory = goodsInventoryService.queryGoodsInventory(params);
					if(null != inventory && inventory.size() > 0){
						GoodsInventoryVo goodsInventoryVo = inventory.get(0);
						short newSellingQuantity = (short) (goodsInventoryVo.getSellingQuantity().shortValue() - orderDetail.getQuantity().shortValue());
						goodsInventoryVo.setSellingQuantity(newSellingQuantity);
						
						if(newSellingQuantity > 0){
							//修改库存
							goodsInventoryService.updateByPrimaryKeySelective(goodsInventoryVo);
							
							//插入商品明细
							orderDetailMapper.insertSelective(orderDetail);
							
							//将购物车商品的状态设置为已购买
							ShoppingCart sc = new ShoppingCart();
							sc.setGoodsId(orderDetail.getGoodsId());
							sc.setCustomerId(orderVo.getCustomerId());
							sc.setStatus(SHOPPING_CART_STATUS.BOUGHT.getCode());
							shoppingCartMapper.updateByCustomerAndGoodsIdSelective(sc);
						}
					}
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
