package com.fruit.controller.front;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.fruit.enu.Enums.SHOPPING_CART_STATUS;
import com.fruit.model.ShoppingCart;
import com.fruit.model.vo.ShoppingCartVo;
import com.fruit.service.ShoppingCartService;

@Controller
@RequestMapping(value="/shoppingCart")
public class ShoppingCartController {
	
	@Autowired
	private ShoppingCartService shoppingCartService;
	
	/**
	 * 
	 * @return
	 */
	@RequestMapping(value="myShoppingCart")
	public ModelAndView listShpCartGoods(){
		ModelAndView mav = new ModelAndView("/webpage/front/shpCart/myShpCartView");
		ShoppingCart shoppingCart  = new ShoppingCart();
		shoppingCart.setCustomerId(1L);
		mav.addObject("myShpCards", shoppingCartService.queryShpCartByParam(shoppingCart));
		return mav;
	}
	
	/**
	 * 添加到购物车
	 * @return
	 */
	@RequestMapping(value="addToShpCart")
	public ModelAndView addToShoppingCart(ShoppingCartVo shoppingCartVo){
		ModelAndView mav = new ModelAndView("/webpage/front/goods/goodsDetail");
		
		//绑带已登录的消费者，后期从session中取
		shoppingCartVo.setCustomerId(1L);
		
		
		shoppingCartVo.setStatus(SHOPPING_CART_STATUS.ADDED.getCode());
		
		shoppingCartService.insertSelective(shoppingCartVo);
		
		return mav;
	}
	
	
}
