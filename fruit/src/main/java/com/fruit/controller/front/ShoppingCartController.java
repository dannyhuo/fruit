package com.fruit.controller.front;

import java.util.List;

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
		List<ShoppingCartVo> shpCardGoods = shoppingCartService.queryShpCartByParam(shoppingCart);
		if(null != shpCardGoods){
			mav.addObject("myShpCards", shpCardGoods);
			short quantity = 0;
			float totalMoney = 0;
			//计算总数量和总钱数
			for (ShoppingCartVo shoppingCartVo : shpCardGoods) {
				quantity += shoppingCartVo.getQuantity();
				totalMoney += shoppingCartVo.getSellPriceYuan() * shoppingCartVo.getQuantity();
			}
			mav.addObject("totalMoney", totalMoney);
			mav.addObject("totalCount", quantity);
		}
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
