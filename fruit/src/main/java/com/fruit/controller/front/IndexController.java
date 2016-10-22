package com.fruit.controller.front;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value = "/")
public class IndexController {

	@RequestMapping("/index")
	public ModelAndView index(){
		ModelAndView mav = new ModelAndView("/webpage/front/index");
		
		return mav;
	}
}
