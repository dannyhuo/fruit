package com.fruit.dao.mysql;

import java.util.List;

import com.fruit.model.MenuAuthority;
import com.fruit.model.vo.MenuAuthorityVo;

public interface MenuAuthorityMapper {
    int deleteByPrimaryKey(Long menuAuthorityId);

    int insert(MenuAuthority record);

    int insertSelective(MenuAuthority record);

    MenuAuthority selectByPrimaryKey(Long menuAuthorityId);

    int updateByPrimaryKeySelective(MenuAuthority record);

    int updateByPrimaryKey(MenuAuthority record);
    
    List<MenuAuthorityVo> queryMenuSelective(MenuAuthority record);
}