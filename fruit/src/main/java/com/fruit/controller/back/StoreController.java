package com.fruit.controller.back;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.fruit.enu.Enums.ORDER_STATUS;
import com.fruit.model.vo.FruitOrderVo;
import com.fruit.service.DeliveryAddressService;
import com.fruit.service.FruitOrderDetailService;
import com.fruit.service.FruitOrderService;

@Controller
@RequestMapping("/back/storeController")
public class StoreController {
	
	@Autowired
	private FruitOrderService fruitOrderService;
	
	@Autowired
	private DeliveryAddressService deliveryAddressService;
	
	@Autowired
	private FruitOrderDetailService fruitOrderDetailService;
	

	/**
	 * 出库管理
	 * @return
	 */
	@RequestMapping("/outStore")
	public ModelAndView outStore(){
		ModelAndView mav = new ModelAndView("/webpage/back/storage/outStore");
		
		Map<String, Object> params = new HashMap<>();
		params.put("status", ORDER_STATUS.WAIT_PAY.getCode());
		params.put("startRow", 0);
		params.put("pageSize", 5);
		List<FruitOrderVo> orders = fruitOrderService.querySelective(params);
		if(null != orders && orders.size() > 0){
			for (FruitOrderVo fruitOrderVo : orders) {
				fruitOrderVo.setDeliveryAddress(deliveryAddressService.selectByPrimaryKey(fruitOrderVo.getAddressId()));
				
				Map<String, Object> detailParams = new HashMap<String, Object>();
				detailParams.put("orderId", fruitOrderVo.getOrderId());
				fruitOrderVo.setOrderDetails(fruitOrderDetailService.querySelective(detailParams));
			}
		}
		
		mav.addObject("outStoreOrders", orders);
		return mav;
	}
	
	/**
	 * 入库管理
	 * @return
	 */
	@RequestMapping("/inStore")
	public ModelAndView inStore(){
		ModelAndView mav = new ModelAndView("/webpage/back/storage/inStore");
		
		return mav;
	}
}
