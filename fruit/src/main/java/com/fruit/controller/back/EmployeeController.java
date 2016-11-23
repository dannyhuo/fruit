package com.fruit.controller.back;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.fruit.dao.mysql.EmployeeMapper;
import com.fruit.enu.Enums.EMPLOYEE_ROLE;
import com.fruit.enu.Enums.EMPLOYEE_STATUS;
import com.fruit.model.vo.EmployeeVo;
import com.fruit.service.EmployeeService;
import com.fruit.util.PwdUtil;

@Controller
@RequestMapping(value = "/back/employee")
public class EmployeeController {
	
	private Logger log = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private EmployeeService employeeService;

	
	@RequestMapping(value = "/toRegister")
	public ModelAndView toRegister(){
		ModelAndView mav = new ModelAndView("/webpage/back/user/employee");
		
		//查询员工
		queryEmployee(mav);
		return mav;
	}
	
	@RequestMapping(value = "/register")
	public ModelAndView toRegister(EmployeeVo employeeVo, HttpServletRequest request){
		ModelAndView mav = new ModelAndView("/webpage/back/user/employee");
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
		
		employeeService.insertSelective(employeeVo);
		
		//查询员工
		queryEmployee(mav);
		
		return mav;
	}
	
	/**
	 * 解雇
	 * @param employeeVo
	 * @return
	 */
	@RequestMapping(value = "/fire")
	public ModelAndView fire(EmployeeVo employeeVo, HttpServletRequest request){
		ModelAndView mav = new ModelAndView("/webpage/back/user/employee");
		
		EmployeeVo employee = (EmployeeVo)request.getSession().getAttribute("employee");
		if(null != employee && EMPLOYEE_ROLE.ADMIN.getCode() == employee.getRole()){
			updateEmployeeStatus(employeeVo, EMPLOYEE_STATUS.GET_FIRED);
		}
		
		//查询员工
		queryEmployee(mav);
		return mav;
	}
	
	/**
	 * 离职
	 * @param employeeVo
	 * @return
	 */
	@RequestMapping(value = "/dimission")
	public ModelAndView dimission(EmployeeVo employeeVo, HttpServletRequest request){
		ModelAndView mav = new ModelAndView("/webpage/back/user/employee");
		
		EmployeeVo employee = (EmployeeVo)request.getSession().getAttribute("employee");
		if(null != employee && EMPLOYEE_ROLE.ADMIN.getCode() == employee.getRole()){
			updateEmployeeStatus(employeeVo, EMPLOYEE_STATUS.DIMISSION);
		}
		//查询员工
		queryEmployee(mav);
		return mav;
	}
	
	/**
	 * 转正
	 * @param employeeVo
	 * @return
	 */
	@RequestMapping(value = "/official")
	public ModelAndView official(EmployeeVo employeeVo, HttpServletRequest request){
		ModelAndView mav = new ModelAndView("/webpage/back/user/employee");
		EmployeeVo employee = (EmployeeVo)request.getSession().getAttribute("employee");
		if(null != employee && EMPLOYEE_ROLE.ADMIN.getCode() == employee.getRole()){
			updateEmployeeStatus(employeeVo, EMPLOYEE_STATUS.OFFICIAL);
		}
		//查询员工
		queryEmployee(mav);
		return mav;
	}
	
	/**
	 * 入职
	 * @param employeeVo
	 * @return
	 */
	@RequestMapping(value = "/probation")
	public ModelAndView probation(EmployeeVo employeeVo, HttpServletRequest request){
		ModelAndView mav = new ModelAndView("/webpage/back/user/employee");
		
		EmployeeVo employee = (EmployeeVo)request.getSession().getAttribute("employee");
		if(null != employee && EMPLOYEE_ROLE.ADMIN.getCode() == employee.getRole()){
			updateEmployeeStatus(employeeVo, EMPLOYEE_STATUS.PROBATION);
		}
		//查询员工
		queryEmployee(mav);
		return mav;
	}
	
	/**
	 * 后台安全退出
	 * @param request
	 * @param response
	 */
	@RequestMapping(value = "/exit")
	public void exit(HttpServletRequest request, HttpServletResponse response){
		request.getSession().removeAttribute("employee");
		
		try {
			response.sendRedirect("/fruit/back/toLogin.do");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	private void queryEmployee(ModelAndView mav){
		//查询员工
		Map<String, Object> params = new HashMap<>();
		params.put("is_valid", "Y");
		List<EmployeeVo> employees = employeeService.querySelective(params);
		mav.addObject("employees",employees);
	}
	
	private void updateEmployeeStatus(EmployeeVo employeeVo, EMPLOYEE_STATUS status){
		employeeVo.setEmployeeStatus(status.getCode());
		employeeService.updateByPrimaryKeySelective(employeeVo);
	}
}
