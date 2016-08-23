package com.fruit.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

public class AbstractDaoSupport extends SqlSessionDaoSupport{
	
	private String nameSpace;
	
	public AbstractDaoSupport(String nameSpace) {
		super();
		this.nameSpace = nameSpace;
	}
	
	/**
	 * 生成MyBatis SqlMap的key
	 * @param id
	 * @return
	 */
	private String createSqlMapKey(String id){
		return new StringBuffer(this.nameSpace).append(".").append(id).toString();
	}
	
	/**
	 * 查询列表
	 * @param key
	 * @param param
	 * @return
	 */
	public <T> List<T> getList(String key, Object param){
		if(null == param){
			return null;
		}else{
			return getSqlSession().selectList(createSqlMapKey(key), param);
		}
	}
	
	public <T> T get(String key, Object param){
		if(null == param){
			return null;
		}else{
			List<T> list = this.getList(key, param);
			if(null == list || list.isEmpty()){
				return null;
			}else{
				return list.get(0);
			}
		}
	}

	@Autowired
    @Qualifier("sqlSessionTemplateMysql")
    public void SqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate){  
    	super.setSqlSessionTemplate(sqlSessionTemplate); 
    }  
}
