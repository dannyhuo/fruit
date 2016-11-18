package com.fruit.controller.front;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.fruit.enu.Enums.GOODS_CATEGORY;
import com.fruit.model.vo.GoodsVo;
import com.fruit.service.GoodsService;

@Controller
@RequestMapping(value = "/")
public class IndexController {
	
	@Autowired
	private GoodsService goodsService;

	@RequestMapping("/index")
	public ModelAndView index(){
		ModelAndView mav = new ModelAndView("/webpage/front/index");
		
		GoodsVo goodsVo = new GoodsVo();
		goodsVo.setPageNo(1);
		goodsVo.setPageSize(5);
		
		List<List<GoodsVo>> gooddes = new ArrayList<List<GoodsVo>>();
		goodsVo.setGoodsCategory(GOODS_CATEGORY.JIN_KOU.getCode());
		gooddes.add(goodsService.selectByParam(goodsVo));
		goodsVo.setGoodsCategory(GOODS_CATEGORY.GUO_CHAN.getCode());
		gooddes.add(goodsService.selectByParam(goodsVo));
		goodsVo.setGoodsCategory(GOODS_CATEGORY.JIANG_GUO.getCode());
		gooddes.add(goodsService.selectByParam(goodsVo));
		goodsVo.setGoodsCategory(GOODS_CATEGORY.GUA_GUO.getCode());
		gooddes.add(goodsService.selectByParam(goodsVo));
		goodsVo.setGoodsCategory(GOODS_CATEGORY.JU_GUO.getCode());
		gooddes.add(goodsService.selectByParam(goodsVo));
		goodsVo.setGoodsCategory(GOODS_CATEGORY.HE_GUO.getCode());
		gooddes.add(goodsService.selectByParam(goodsVo));
		goodsVo.setGoodsCategory(GOODS_CATEGORY.REN_GUO.getCode());
		gooddes.add(goodsService.selectByParam(goodsVo));
		goodsVo.setGoodsCategory(GOODS_CATEGORY.QI_TA.getCode());
		gooddes.add(goodsService.selectByParam(goodsVo));
		mav.addObject("goodses", gooddes);
		return mav;
	}
	
	@RequestMapping(value="/goodsSearch")
	public ModelAndView goodsSearch(GoodsVo goodsVo){
		ModelAndView mav = new ModelAndView("/webpage/front/index");
		
		if(null == goodsVo.getKeyWords() || "".equals(goodsVo.getKeyWords().trim())){
			goodsVo = new GoodsVo();
		}
		
		mav.addObject("listGoodses", goodsService.searchByKeyWords(goodsVo));
		
		mav.addObject("keyWords", goodsVo.getKeyWords());
		
		return mav;
	}
	
	@RequestMapping(value="/goodsDetail")
	public ModelAndView goodsDetail(GoodsVo goodsVo){
		ModelAndView mav = new ModelAndView("/webpage/front/goods/goodsDetail");
		
		mav.addObject("goods", goodsService.selectByPrimaryKey(goodsVo.getGoodsId()));
		
		return mav;
	}
}
