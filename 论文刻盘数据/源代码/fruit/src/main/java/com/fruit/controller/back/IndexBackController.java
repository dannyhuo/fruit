package com.fruit.controller.back;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value = "/back")
public class IndexBackController {
	
	//private Logger log = LoggerFactory.getLogger(this.getClass());
	
	//@Autowired
	//private EmployeeMapper employeeMapper;

	@RequestMapping(value = "/index")
	public ModelAndView goodsIndex(){
		ModelAndView mav = new ModelAndView("/webpage/back/index");
		return mav;
	}
	
	@RequestMapping(value = "/toLogin")
	public ModelAndView toLogin(){
		ModelAndView mav = new ModelAndView("/webpage/back/login");
		return mav;
	}
	
	
	
}
