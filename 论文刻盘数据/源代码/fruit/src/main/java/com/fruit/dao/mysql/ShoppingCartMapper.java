package com.fruit.dao.mysql;

import java.util.List;

import com.fruit.model.ShoppingCart;
import com.fruit.model.vo.ShoppingCartVo;

public interface ShoppingCartMapper {
    int deleteByPrimaryKey(Long shoppingCartId);

    int insert(ShoppingCart record);

    int insertSelective(ShoppingCart record);

    ShoppingCart selectByPrimaryKey(Long shoppingCartId);

    int updateByPrimaryKeySelective(ShoppingCart record);

    int updateByPrimaryKey(ShoppingCart record);
    
    int updateByCustomerAndGoodsIdSelective(ShoppingCart record);
    
    List<ShoppingCartVo> queryShpCartByParam(ShoppingCart shoppingCart);
    
}