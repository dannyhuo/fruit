package com.fruit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fruit.dao.mysql.MenuAuthorityMapper;
import com.fruit.model.MenuAuthority;
import com.fruit.model.vo.MenuAuthorityVo;

@Service("menuAuthorityService")
public class MenuAuthorityService {

	@Autowired
	private MenuAuthorityMapper menuAuthorityMapper;
	
	public int insertSelective(MenuAuthority record){
		return menuAuthorityMapper.insertSelective(record);
	}

    public MenuAuthority selectByPrimaryKey(Long menuAuthorityId){
    	return menuAuthorityMapper.selectByPrimaryKey(menuAuthorityId);
    }
    
    public List<MenuAuthorityVo> queryMenuSelective(MenuAuthority record){
    	return menuAuthorityMapper.queryMenuSelective(record);
    }
	
	
}
