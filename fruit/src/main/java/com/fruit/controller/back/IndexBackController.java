package com.fruit.controller.back;

import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.fruit.dao.mysql.EmployeeMapper;
import com.fruit.model.vo.EmployeeVo;
import com.fruit.util.PwdUtil;

@Controller
@RequestMapping(value = "/back")
public class IndexBackController {
	
	private Logger log = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private EmployeeMapper employeeMapper;

	@RequestMapping(value = "/index")
	public ModelAndView goodsIndex(){
		ModelAndView mav = new ModelAndView("/webpage/back/index");
		return mav;
	}
	
	@RequestMapping(value = "/toRegister")
	public ModelAndView toRegister(){
		ModelAndView mav = new ModelAndView("/webpage/back/register");
		return mav;
	}
	
	@RequestMapping(value = "/register")
	public ModelAndView toRegister(EmployeeVo employeeVo, HttpServletRequest request){
		ModelAndView mav = new ModelAndView("/webpage/back/index");
		if(null == employeeVo.getPassword()){
			mav.addObject("message","密码不可为空");
			mav.addObject("success", false);
			return mav;
		}
		
		if(!employeeVo.getPassword().equals(employeeVo.getConfirmPassword())){
			mav.addObject("message","确认密码输入不一致");
			mav.addObject("success", false);
			return mav;
		}
		
		try {
			employeeVo.setPassword(PwdUtil.password(employeeVo.getPassword()));
		} catch (UnsupportedEncodingException e) {
			log.error("Generate the secret factor found error.", e);
		} catch (NoSuchAlgorithmException e) {
			log.error("Encrept the password found error.", e);
		}
		
		int result = employeeMapper.insertSelective(employeeVo);
		
		request.getSession().setAttribute("employee", employeeVo);
		
		mav.addObject("result",result);
		mav.addObject("success", true);
		
		return mav;
	}
	
	@RequestMapping(value = "/toLogin")
	public ModelAndView toLogin(){
		ModelAndView mav = new ModelAndView("/webpage/back/login");
		return mav;
	}
	
	
	
}
