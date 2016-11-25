package com.fruit.controller.back;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.fruit.dao.mysql.BackMenuMapper;
import com.fruit.dao.mysql.MenuAuthorityMapper;
import com.fruit.model.BackMenu;
import com.fruit.model.vo.MenuAuthorityVo;

@Controller
@RequestMapping("/back/menuController")
public class MenuController {
	@Autowired
	private MenuAuthorityMapper menuAuthorityMapper;
	
	@Autowired
	private BackMenuMapper backMenuMapper;
	
	@RequestMapping("/toAddMenu")
	public ModelAndView toMenuPage(){
		ModelAndView mav = new ModelAndView("/webpage/back/menuManage/addMenu");
		
		return mav;
	}
	
	@RequestMapping("/addMenu")
	public ModelAndView toMenuPage(BackMenu menu){
		ModelAndView mav = new ModelAndView("/webpage/back/menuManage/addMenu");
		backMenuMapper.insertSelective(menu);
		return mav;
	}
	
	/**
	 * 去分配权限
	 * @param menu
	 * @return
	 */
	@RequestMapping("/toAuthority")
	public ModelAndView toAuthority(HttpServletRequest request){
		ModelAndView mav = new ModelAndView("/webpage/back/menuManage/addAuthority");
		request.setAttribute("menus", backMenuMapper.querySelective(new BackMenu()));
		return mav;
	}
	
	/**
	 * 分配权限
	 * @param menu
	 * @return
	 */
	@RequestMapping("/addAuthority")
	public ModelAndView addAuthority(HttpServletRequest request, MenuAuthorityVo menuAuthorityVo){
		ModelAndView mav = new ModelAndView("/webpage/back/menuManage/addAuthority");
		menuAuthorityMapper.insertSelective(menuAuthorityVo);
		
		request.setAttribute("menus", backMenuMapper.querySelective(new BackMenu()));
		return mav;
	}

}
