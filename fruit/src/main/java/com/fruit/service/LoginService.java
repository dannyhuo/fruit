package com.fruit.service;

import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fruit.dao.mysql.CustomerMapper;
import com.fruit.dao.mysql.EmployeeMapper;
import com.fruit.model.vo.CustomerVo;
import com.fruit.model.vo.EmployeeVo;
import com.fruit.util.PwdUtil;

@Service("loginService")
public class LoginService {
	
	//private Logger log = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private CustomerMapper customerMapper;
	
	@Autowired
	private EmployeeMapper employeeMapper;
	
	public CustomerVo login(String loginName, String password) 
			throws UnsupportedEncodingException, NoSuchAlgorithmException{
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("loginName", loginName);
		CustomerVo customerVo = new CustomerVo();
		customerVo.setLoginSuccess(false);
		List<CustomerVo> customers = customerMapper.querySelective(param);
		if(null != customers && customers.size() > 0){
			customerVo = customers.get(0);
			String inputPwd = PwdUtil.password(password, customerVo.getSafetyFactor());
			if(customerVo.getPassword().equals(inputPwd)){
				customerVo.setLoginSuccess(true);
				return customerVo;
			}
		}
		customerVo.setLoginMessage("用户名或密码有误！");
		return customerVo;
	}
	
	public EmployeeVo backLogin(String loginName, String password) 
			throws UnsupportedEncodingException, NoSuchAlgorithmException{
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("loginName", loginName);
		EmployeeVo employeeVo = new EmployeeVo();
		employeeVo.setLoginSuccess(false);
		List<EmployeeVo> employees = employeeMapper.querySelective(param);
		if(null != employees && employees.size() > 0){
			employeeVo = employees.get(0);
			String inputPwd = PwdUtil.password(password);
			if(employeeVo.getPassword().equals(inputPwd)){
				employeeVo.setLoginSuccess(true);
				return employeeVo;
			}
		}
		employeeVo.setLoginMessage("用户名或密码有误！");
		return employeeVo;
	}

}
