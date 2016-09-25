package com.fruit.dao.oracle;

import java.util.List;
import java.util.Map;


import com.fruit.model.UserUser;

public interface UserUserMapper{
    int deleteByPrimaryKey(Long userId);

    int insert(UserUser record);

    int insertSelective(UserUser record);

    UserUser selectByPrimaryKey(Long userId);

    int updateByPrimaryKeySelective(UserUser record);

    int updateByPrimaryKey(UserUser record);
    
    List<UserUser> queryByParam(Map<String, Object> param);
    
    int queryByParamCount(Map<String, Object> param);
}