package com.fruit.controller;

import java.io.Serializable;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.fruit.model.UserUser;
import com.fruit.service.UserUserService;

/**
 * 测试
 * @author Administrator
 *
 */
@Controller
@RequestMapping(value = "/fruitController")
public class FruitController implements Serializable{
	
	@Autowired
	UserUserService userUserService;
	

	/**
	 * 
	 */
	private static final long serialVersionUID = -9195692594771745999L;
	
	@RequestMapping(value = "/helloWord.do")
	public ModelAndView helloWord(UserUser user){
		ModelAndView mav = new ModelAndView("/webpage/helloWord");
		UserUser myuser = userUserService.selectByPrimaryKey(user.getUserId());
		System.out.println(user.toString());
		mav.addObject("userId", myuser.getUserId());
		mav.addObject("userName", myuser.getUserName());
		mav.addObject("password", myuser.getIsValid());
		
		
		Map<String, Object> param = new HashMap<String, Object>();
		//param.put("userId", user.getUserId());
		param.put("userName", user.getUserName());
		List<UserUser> result = userUserService.queryByParam(param);
		if(null != result && !result.isEmpty()){
			System.out.println(result.size());
			UserUser user2 = result.get(0);
			mav.addObject("userId", user2.getUserId());
			mav.addObject("userName", user2.getUserName());
			mav.addObject("password", user2.getMemo());
		}else{
			System.out.println("query the result is null");
		}
		return mav;
	}
	
	
	@RequestMapping(value = "/listHelloWord.do")
	public ModelAndView listHelloWord(UserUser user){
		ModelAndView mav = new ModelAndView("/webpage/listHelloWord");
		if(null == user || null == user.getUserName() || user.getUserName().trim().equals("")){
			return mav;
		}
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("userName", user.getUserName());
		List<UserUser> result = userUserService.queryByParam(param);
		if(null != result && !result.isEmpty()){
			System.out.println(result.size());
			mav.addObject("pageContent", result);
		}else{
			System.out.println("query the result is null");
		}
		mav.addObject("userName", user.getUserName());
		return mav;
	}
	
	@RequestMapping(value = "/testBatchInsert.do")
	public ModelAndView testBatchInsert(){
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("userName", "danny");
		List<UserUser> users = userUserService.queryByParam(param);
		userUserService.batchInsert(users);
		return new ModelAndView();
	}
	
	@RequestMapping(value = "/testBatchSync.do")
	public void batchSync(){
		Map<String, Object> param = new HashMap<String, Object>();
		int count = userUserService.queryByParamCount(param);
		int pageSize = 1000;
		int index = 0;
		for(;index < count; index += pageSize){
			param.put("startRow", index);
			param.put("endRow", index += pageSize);
			userUserService.batchInsert(userUserService.queryByParam(param));
		}
		System.out.println(count);
	}
	
}
