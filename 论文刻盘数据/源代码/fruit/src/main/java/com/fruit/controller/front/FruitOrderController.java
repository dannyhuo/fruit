package com.fruit.controller.front;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.fruit.dao.mysql.DeliveryAddressMapper;
import com.fruit.enu.Enums.ORDER_STATUS;
import com.fruit.model.Customer;
import com.fruit.model.DeliveryAddress;
import com.fruit.model.Goods;
import com.fruit.model.vo.FruitOrderDetailVo;
import com.fruit.model.vo.FruitOrderVo;
import com.fruit.service.FruitOrderService;
import com.fruit.service.GoodsService;

@Controller
@RequestMapping(value="/order")
public class FruitOrderController {
	
	@Autowired
	private FruitOrderService fruitOrderService;
	
	@Autowired
	private GoodsService goodsService;
	
	@Autowired
	private DeliveryAddressMapper DeliveryAddressMapper;
	
	
	/**
	 * 去订单中心结算
	 * @return
	 */
	@RequestMapping(value="/toPayTheBill")
	public ModelAndView toPayTheBill(HttpServletRequest request){
		ModelAndView mav = new ModelAndView("/webpage/front/order/order");
		String shpGoods = request.getParameter("shpGoods");
		
		//1、从session中获取用户信息
		Customer customer = (Customer) request.getSession().getAttribute("customer");
		
		if(null != shpGoods){
			try{
				//2、构造订单对象
				String[] goods = shpGoods.split(",");
				FruitOrderVo orderVo = new FruitOrderVo();
				orderVo.setCustomerId(customer.getCustomerId());
				List<FruitOrderDetailVo> orderDetails = new ArrayList<FruitOrderDetailVo>();
				orderVo.setOrderDetails(orderDetails);
				orderVo.setStatus(ORDER_STATUS.WAIT_PAY.getCode());
				Long totalOughtPay = 0L;
				
				for (String st : goods) {
					//3、查询商品
					String[] tmp = st.split(":");
					Goods curGoods = goodsService.selectByPrimaryKey(Long.parseLong(tmp[1]));
					if(null != curGoods){
						//4、构造商品明细对象
						FruitOrderDetailVo orderDetail = new FruitOrderDetailVo();
						orderDetail.setGoodsId(curGoods.getGoodsId());
						short quantity = Short.parseShort(tmp[2]);
						orderDetail.setQuantity(quantity);
						orderDetail.setTotalOughtPay(curGoods.getSellPrice() * quantity);
						orderDetail.setTotalPay(orderDetail.getTotalOughtPay());
						orderDetails.add(orderDetail);
						totalOughtPay += orderDetail.getTotalOughtPay();
						
						//设置商品其它信息
						orderDetail.setGoodsName(curGoods.getGoodsName());
						orderDetail.setGoodsImageUrl(curGoods.getGoodsImageUrl());
					}
				}
				orderVo.setOrderOughtPay(totalOughtPay);
				orderVo.setOrderPay(totalOughtPay);
				
				//5、保存订单对象到视图模型
				mav.addObject("order", orderVo);
				HttpSession session = request.getSession();
				if(null != session.getAttribute("myOrder")){
					session.removeAttribute("myOrder");
				}
				session.setAttribute("myOrder", orderVo);
				
				List<DeliveryAddress> addresses = DeliveryAddressMapper.queryDeliveryAddress(customer.getCustomerId());
				if(null != addresses && addresses.size() > 0){
					mav.addObject("addresses", addresses);
				}
			}catch(Exception e){
				mav.addObject("orderOk", false);
				mav.addObject("message", "预定失败，请您稍后重试！");
			}
		}
		return mav;
	}
	
	/**
	 * 
	 * @return
	 */
	@RequestMapping(value="/saveOrder")
	public ModelAndView saveOrder(HttpServletRequest request){
		ModelAndView mav = new ModelAndView("/webpage/front/order/orderResult");
		
		String addressId = request.getParameter("addressId");
		
		//1、从session中获取用户信息
		FruitOrderVo orderVo = (FruitOrderVo) request.getSession().getAttribute("myOrder");
		
		if(null != orderVo){
			orderVo.setAddressId(Long.parseLong(addressId));
			
			//2、将订单对象保存至数据库
			fruitOrderService.saveOrder(orderVo);
			mav.addObject("orderOk", true);
			
			mav.addObject("message", "恭喜您预订成功，请您牢记订单号" + orderVo.getOrderId());
			mav.addObject("orderId", orderVo.getOrderId());
		}else{
			mav.addObject("orderOk", true);
			mav.addObject("message", "您提交的信息有误，请您重新购买！");
		}
		
		return mav;
	}
	
	@RequestMapping(value="/orderDetail")
	public ModelAndView fruitOrderDetail(@RequestParam("orderId") Long orderId){
		ModelAndView mav = new ModelAndView("/webpage/front/order/orderDetail");
		mav.addObject("order",fruitOrderService.selectByPrimaryKey(orderId));
		return mav;
	}
	
	@RequestMapping(value="/addAddress")
	public ModelAndView addAddress(DeliveryAddress deliveryAddress, HttpServletRequest request){
		ModelAndView mav = new ModelAndView("/webpage/front/order/order");
		Customer customer = (Customer) request.getSession().getAttribute("customer");
		deliveryAddress.setCustomerId(customer.getCustomerId());
		DeliveryAddressMapper.insertSelective(deliveryAddress);
		
		return mav;
	}
}
