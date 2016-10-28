package com.fruit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fruit.dao.mysql.ShoppingCartMapper;
import com.fruit.model.ShoppingCart;
import com.fruit.model.vo.ShoppingCartVo;

@Service("shoppingCartService")
public class ShoppingCartService {
	
	@Autowired
	private ShoppingCartMapper shoppingCartMapper;
	
	public int deleteByPrimaryKey(Long shoppingCartId){
		return shoppingCartMapper.deleteByPrimaryKey(shoppingCartId);
	}

	public int insert(ShoppingCart record){
    	return shoppingCartMapper.insert(record);
    }

    public int insertSelective(ShoppingCart record){
    	return shoppingCartMapper.insertSelective(record);
    }

    public ShoppingCart selectByPrimaryKey(Long shoppingCartId){
    	return shoppingCartMapper.selectByPrimaryKey(shoppingCartId);
    }

    public int updateByPrimaryKeySelective(ShoppingCart record){
    	return shoppingCartMapper.updateByPrimaryKeySelective(record);
    }

    public int updateByPrimaryKey(ShoppingCart record){
    	return shoppingCartMapper.updateByPrimaryKey(record);
    }

    public List<ShoppingCartVo> queryShpCartByParam(ShoppingCart shoppingCart){
    	return shoppingCartMapper.queryShpCartByParam(shoppingCart);
    }
}
