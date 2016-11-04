package com.fruit.controller.back;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value = "/back")
public class IndexBackController {

	@RequestMapping(value = "/index")
	public ModelAndView goodsIndex(){
		ModelAndView mav = new ModelAndView("/webpage/back/index");
		return mav;
	}
	
	
	
}
