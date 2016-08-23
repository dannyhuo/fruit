package com.fruit.service;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.ExecutorType;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.defaults.DefaultSqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.WebApplicationContext;

import com.fruit.dao.UserUserMapper;
import com.fruit.model.UserUser;

@Service("userUserService")
public class UserUserService {
	
	@Autowired
	private UserUserMapper userUserMapper;
	
	@Autowired
	private WebApplicationContext applicationContext;
	
	public UserUser selectByPrimaryKey(Long userId){
		return userUserMapper.selectByPrimaryKey(userId);
	}
	
	public List<UserUser> queryByParam(Map<String, Object> param){
		return userUserMapper.queryByParam(param);
	}
	
	public int queryByParamCount(Map<String, Object> param){
		return userUserMapper.queryByParamCount(param);
	}
	
	/**
	 * 批量更新操作
	 * @param users
	 */
	public void batchInsert(List<UserUser> users){
		DefaultSqlSessionFactory sqlSessionFactory = (DefaultSqlSessionFactory) applicationContext.getBean("sqlSessionFactory_emall");
		SqlSession batchSession = sqlSessionFactory.openSession(ExecutorType.BATCH, false);
		int size = users.size();
		int batchUnitNum = 100;
		UserUserMapper mapper = batchSession.getMapper(UserUserMapper.class);
		for(int index = 0; index < size; index++){
			UserUser curUser = users.get(index);
			curUser.setUpdateTime(new Date());
			if(null == mapper.selectByPrimaryKey(curUser.getUserId())){
				mapper.insert(curUser);
			}
			if(index > 0 && index % batchUnitNum == 0){
				batchSession.commit();
			}
		}
		batchSession.commit();
	}
	
}
