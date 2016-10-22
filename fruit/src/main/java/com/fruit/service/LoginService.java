package com.fruit.service;

import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fruit.dao.mysql.CustomerMapper;
import com.fruit.model.vo.CustomerVo;
import com.fruit.util.PwdUtil;

@Service("loginService")
public class LoginService {
	
	//private Logger log = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private CustomerMapper customerMapper;
	
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

}
