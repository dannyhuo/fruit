package com.fruit.controller;

import java.io.Serializable;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.fruit.dao.mysql.CustomerMapper;
import com.fruit.model.vo.CustomerVo;
import com.fruit.util.IDManager;

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
		
		
		customerVo.setCustomerNo(IDManager.generHaxi32());
		
		int result = customerMapper.insertSelective(customerVo);
		
		mav.addObject("result",result);
		return mav;
	}
}
