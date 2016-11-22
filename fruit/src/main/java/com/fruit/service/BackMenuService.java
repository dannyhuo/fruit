package com.fruit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fruit.dao.mysql.BackMenuMapper;
import com.fruit.model.BackMenu;

@Service("backMenuService")
public class BackMenuService {

	@Autowired
	private BackMenuMapper backMenuMapper;
	
	public int insertSelective(BackMenu record){
		return backMenuMapper.insertSelective(record);
	}

    public BackMenu selectByPrimaryKey(Long menuId){
    	return backMenuMapper.selectByPrimaryKey(menuId);
    }
    
    public List<BackMenu> querySelective(BackMenu record){
    	return backMenuMapper.querySelective(record);
    }
}
