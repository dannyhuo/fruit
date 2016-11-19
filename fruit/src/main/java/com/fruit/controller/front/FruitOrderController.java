package com.fruit.controller.front;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.junit.runners.Parameterized.Parameters;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.fruit.enu.Enums.ORDER_STATUS;
import com.fruit.model.Customer;
import com.fruit.model.Goods;
import com.fruit.model.FruitOrderDetail;
import com.fruit.model.vo.FruitOrderVo;
import com.fruit.service.GoodsService;
import com.fruit.service.FruitOrderService;

@Controller
@RequestMapping(value="/order")
public class FruitOrderController {
	
	@Autowired
	private FruitOrderService fruitOrderService;
	
	@Autowired
	private GoodsService goodsService;
	
	/**
	 * 
	 * @return
	 */
	@RequestMapping(value="/saveOrder")
	public ModelAndView saveOrder(HttpServletRequest request){
		ModelAndView mav = new ModelAndView("/webpage/front/order/orderResult");
		
		String shpGoods = request.getParameter("shpGoods");
		
		Customer customer = (Customer) request.getSession().getAttribute("customer");
		
		if(null != shpGoods){
			try{
				String[] goods = shpGoods.split(",");
				FruitOrderVo orderVo = new FruitOrderVo();
				orderVo.setCustomerId(customer.getCustomerId());
				List<FruitOrderDetail> orderDetails = new ArrayList<FruitOrderDetail>();
				orderVo.setOrderDetails(orderDetails);
				orderVo.setStatus(ORDER_STATUS.WAIT_PAY.getCode());
				Long totalOughtPay = 0L;
				for (String st : goods) {
					String[] tmp = st.split(":");
					Goods curGoods = goodsService.selectByPrimaryKey(Long.parseLong(tmp[1]));
					if(null != curGoods){
						FruitOrderDetail orderDetail = new FruitOrderDetail();
						orderDetail.setGoodsId(curGoods.getGoodsId());
						short quantity = Short.parseShort(tmp[2]);
						orderDetail.setQuantity(quantity);
						orderDetail.setTotalOughtPay(curGoods.getSellPrice() * quantity);
						orderDetail.setTotalPay(orderDetail.getTotalOughtPay());
						orderDetails.add(orderDetail);
						totalOughtPay += orderDetail.getTotalOughtPay();
					}
				}
				orderVo.setOrderOughtPay(totalOughtPay);
				orderVo.setOrderPay(totalOughtPay);
				fruitOrderService.saveOrder(orderVo);
				
				mav.addObject("orderOk", true);
				mav.addObject("message", "恭喜您预订成功，请您牢记订单号" + orderVo.getOrderId());
				mav.addObject("orderId", orderVo.getOrderId());
			}catch(Exception e){
				mav.addObject("orderOk", false);
				mav.addObject("message", "预定失败，请您稍后重试！");
			}
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
}
