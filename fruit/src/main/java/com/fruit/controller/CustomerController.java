package com.fruit.controller;

import java.io.Serializable;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.fruit.dao.mysql.CustomerMapper;
import com.fruit.model.Customer;
import com.fruit.model.UserUser;
import com.fruit.model.vo.CustomerVo;
import com.fruit.service.MobileFavoriteArchivingService;
import com.fruit.service.UserUserService;

/**
 * 测试
 * @author huoqiang
 *
 */
@Controller
@RequestMapping(value = "/customerController")
public class CustomerController implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -5975506581228466228L;
	
	@Autowired
	CustomerMapper customerMapper;

	@RequestMapping(value = "/register")
	public ModelAndView register(){
		ModelAndView mav = new ModelAndView("/webpage/register");
		return mav;
	}
	
	@RequestMapping(value = "/doRegister")
	public ModelAndView doRegister(CustomerVo customerVo){
		ModelAndView mav = new ModelAndView("/webpage/front/registerResult");
		
		
		UUID uuid = UUID.randomUUID();
		customerVo.setCustomerNo(uuid.toString().replaceAll("-", ""));
		
		int result = customerMapper.insertSelective(customerVo);
		
		mav.addObject("result",result);
		return mav;
	}
}
