package com.fruit.service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.ExecutorType;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.defaults.DefaultSqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.WebApplicationContext;

import com.fruit.dao.oracle.MobileFavoriteHistoryMapper;
import com.fruit.dao.oracle.MobileFavoriteMapper;
import com.fruit.model.MobileFavorite;

@Service("mobileFavoriteArchivingService")
public class MobileFavoriteArchivingService {
	
	/*@Autowired
	private MobileFavoriteMapper mobileFavoriteMapper;
	
	@Autowired
	private MobileFavoriteHistoryMapper mobileFavoriteHistoryMapper;*/
	
	@Autowired
	private WebApplicationContext applicationContext;
	
	private final int pageSize = 100;
	
	public void archarving(Date endDate){
		DefaultSqlSessionFactory sqlSessionFactory = (DefaultSqlSessionFactory) applicationContext.getBean("sqlSessionFactory_oracle");
		SqlSession batchSession = sqlSessionFactory.openSession(ExecutorType.BATCH, false);
		MobileFavoriteHistoryMapper favoriteHistoryMapper = batchSession.getMapper(MobileFavoriteHistoryMapper.class);
		
		MobileFavoriteMapper favoriteMapper = batchSession.getMapper(MobileFavoriteMapper.class);
		
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("endDate", endDate);
		int count = favoriteHistoryMapper.countFavoriterList(param);
		
		int totalPage = 0;
		if(count % pageSize == 0){
			totalPage = count / pageSize;
		}else{
			totalPage = count / pageSize + 1;
		}
		
		param.put("isPaging", true);
		List<MobileFavorite> favorites = null;
		for(int p = totalPage; p > 0; p--){
			int startRows = (p - 1) * pageSize + 1;
			int endRows = p * pageSize;
			endRows = endRows > count ? count : endRows;
			param.put("startRows", startRows);
			param.put("endRows", endRows);
			
			favorites = favoriteHistoryMapper.queryFavoriterList(param);

			for(int i = 0; i < favorites.size(); i++){
				//插入到收藏表
				favoriteMapper.insertSelective(favorites.get(i));
				
				//从历史表删除
				favoriteHistoryMapper.deleteByPrimaryKey(favorites.get(i).getId());
				
			}
			batchSession.commit();
			favorites.clear();
		}
	}
}
