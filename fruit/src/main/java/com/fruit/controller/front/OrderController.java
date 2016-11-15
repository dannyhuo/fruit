package com.fruit.controller.front;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fruit.enu.Enums.ORDER_STATUS;
import com.fruit.model.Customer;
import com.fruit.model.Goods;
import com.fruit.model.OrderDetail;
import com.fruit.model.vo.OrderVo;
import com.fruit.service.GoodsService;
import com.fruit.service.OrderService;

@Controller
@RequestMapping(value="/order")
public class OrderController {
	
	@Autowired
	private OrderService orderService;
	
	@Autowired
	private GoodsService goodsService;
	
	/**
	 * 
	 * @return
	 */
	@RequestMapping(value="/saveOrder")
	public void saveOrder(HttpServletRequest request){
		String shpGoods = request.getParameter("shpGoods");
		
		Customer customer = (Customer) request.getSession().getAttribute("customer");
		
		if(null != shpGoods){
			String[] goods = shpGoods.split(",");
			OrderVo orderVo = new OrderVo();
			orderVo.setCustomerId(customer.getCustomerId());
			List<OrderDetail> orderDetails = new ArrayList<OrderDetail>();
			orderVo.setOrderDetails(orderDetails);
			orderVo.setStatus(ORDER_STATUS.WAIT_PAY.getCode());
			/*orderVo.setCreateTime(new Date());
			orderVo.setOrderOughtPay(100L);
			orderVo.setOrderPay(90L);
			orderVo.setRemark("remark");
			orderVo.setOrderId(1L);*/
			for (String st : goods) {
				String[] tmp = st.split(":");
				Goods curGoods = goodsService.selectByPrimaryKey(Long.parseLong(tmp[1]));
				if(null != curGoods){
					OrderDetail orderDetail = new OrderDetail();
					orderDetail.setGoodsId(Long.parseLong(tmp[1]));
					short quantity = Short.parseShort(tmp[2]);
					orderDetail.setQuantity(quantity);
					orderDetail.setTotalOughtPay(curGoods.getSellPrice() * quantity);
					orderDetails.add(orderDetail);
				}
			}
			orderService.saveOrder(orderVo);
		}
	}
	
}
