package com.fruit.controller.front;

import java.io.Serializable;
import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;

import javax.servlet.http.HttpServletRequest;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.fruit.dao.mysql.CustomerMapper;
import com.fruit.model.Customer;
import com.fruit.model.vo.CustomerVo;
import com.fruit.util.IDManager;
import com.fruit.util.PwdUtil;

/**
 * 用户controller
 * @author huoqiang
 *
 */
@Controller
@RequestMapping(value = "/customerController")
public class CustomerController implements Serializable{
	
	private Logger log = LoggerFactory.getLogger(this.getClass());

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
		
		if(null == customerVo.getPassword()){
			mav.addObject("message","密码不可为空");
			mav.addObject("success", false);
			return mav;
		}
		
		if(!customerVo.getPassword().equals(customerVo.getConfirmPassword())){
			mav.addObject("message","确认密码输入不一致");
			mav.addObject("success", false);
			return mav;
		}
		
		customerVo.setCustomerNo(IDManager.generHaxi32());
		
		try {
			customerVo.setSafetyFactor(PwdUtil.generank(customerVo.getPassword()));
			customerVo.setPassword(PwdUtil.password(customerVo.getPassword(), customerVo.getSafetyFactor()));
		} catch (UnsupportedEncodingException e) {
			log.error("Generate the secret factor found error.", e);
		} catch (NoSuchAlgorithmException e) {
			log.error("Encrept the password found error.", e);
		}
		
		int result = customerMapper.insertSelective(customerVo);
		
		mav.addObject("result",result);
		mav.addObject("success", true);
		return mav;
	}
	
	
	@RequestMapping(value = "/tologin")
	public ModelAndView tologin(HttpServletRequest request){
		ModelAndView mav = new ModelAndView("/webpage/login");
		
		//1、判断session中是否做过登录
		Customer sessionCustomer = (Customer) request.getSession().getAttribute("customer");
		if(null != sessionCustomer){
			mav.setViewName("/webpage/front/loginResult");;
			return mav;
		}
		
		return mav;
	}
	
	/*@RequestMapping(value = "/login")
	public ModelAndView login(CustomerVo customerVo, HttpServletRequest request) 
			throws UnsupportedEncodingException, NoSuchAlgorithmException{
		ModelAndView mav = new ModelAndView("/webpage/front/loginResult");
		
		//1、判断session中是否做过登录
		Customer sessionCustomer = (Customer) request.getSession().getAttribute("customer");
		if(null != sessionCustomer){
			mav.addObject("message", "登录成功");
			mav.addObject("success", true);
			return mav;
		}
		
		//2、登录逻辑
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("login_name", customerVo.getLoginName());
		List<CustomerVo> customers = customerMapper.querySelective(param);
		if(null != customers && customers.size() > 0){
			Customer customer = customers.get(0);
			String password = PwdUtil.password(customerVo.getPassword(), customer.getSafetyFactor());
			if(customer.getPassword().equals(password)){
				mav.addObject("message", "登录成功");
				mav.addObject("success", true);
				
				request.getSession().setAttribute("customer", customer);
			}else{
				mav.addObject("message", "用户名或密码错误");
				mav.addObject("success", false);
			}
		}else{
			mav.addObject("message", "用户名或密码错误");
			mav.addObject("success", false);
		}
		
		return mav;
	}*/
	
}
