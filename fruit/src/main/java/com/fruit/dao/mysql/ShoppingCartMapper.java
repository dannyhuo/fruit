package com.fruit.dao.mysql;

import com.fruit.model.ShoppingCart;

public interface ShoppingCartMapper {
    int deleteByPrimaryKey(Long shoppingCartId);

    int insert(ShoppingCart record);

    int insertSelective(ShoppingCart record);

    ShoppingCart selectByPrimaryKey(Long shoppingCartId);

    int updateByPrimaryKeySelective(ShoppingCart record);

    int updateByPrimaryKey(ShoppingCart record);
}