package com.fruit.controller.back;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.fruit.model.vo.GoodsVo;
import com.fruit.service.GoodsService;

@Controller
@RequestMapping(value = "/goodsController")
public class GoodsController {

	@Autowired
	private GoodsService goodsService;
	
	@RequestMapping(value = "/goodsIndex")
	public ModelAndView goodsIndex(){
		ModelAndView mav = new ModelAndView("");


		GoodsVo gv = new GoodsVo();
		gv.setPageNo(1);
		gv.setPageSize(10);
		List<GoodsVo> goodses = goodsService.selectByParam(gv);
		
		mav.addObject("goodses", goodses);
		return mav;
	}
	
}
