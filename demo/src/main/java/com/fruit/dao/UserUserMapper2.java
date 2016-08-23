package com.fruit.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import org.mybatis.spring.SqlSessionTemplate;

import com.fruit.model.UserUser;

@Repository
public class UserUserMapper2 extends AbstractDaoSupport{
	
	public UserUserMapper2() {
		super("com.fruit.dao.UserUserMapper");
	}
	
    int deleteByPrimaryKey(Long userId){
    	return 0;
    };

    int insert(UserUser record){
    	return 0;
    };

    int insertSelective(UserUser record){
    	return 0;
    };

    public UserUser selectByPrimaryKey(Long userId){
    	return this.get("selectByPrimaryKey", userId);
    	//return (UserUser) this.getSqlSession().selectList("com.fruit.dao.UserUserMapper.selectByPrimaryKey",userId.toString()).get(0);
    };

    int updateByPrimaryKeySelective(UserUser record){
    	return 0;
    };

    int updateByPrimaryKey(UserUser record){
    	return 0;
    };
    
    //@Resource
    @Autowired
    @Qualifier("sqlSessionTemplateMysql")
    public void SqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate){  
    	super.setSqlSessionTemplate(sqlSessionTemplate); 
    }  

}