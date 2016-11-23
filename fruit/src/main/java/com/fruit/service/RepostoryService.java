package com.fruit.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fruit.dao.mysql.RepostoryMapper;
import com.fruit.model.Repostory;
import com.fruit.model.vo.RepostoryVo;

@Service("repostoryService")
public class RepostoryService {

	@Autowired
	private RepostoryMapper repostoryMapper;
	
	public int deleteByPrimaryKey(Long repostoryId){
		return repostoryMapper.deleteByPrimaryKey(repostoryId);
	}

	public int insert(Repostory record){
    	return repostoryMapper.insert(record);
    }

    public int insertSelective(Repostory record){
    	return repostoryMapper.insertSelective(record);
    }

    public Repostory selectByPrimaryKey(Long repostoryId){
    	return repostoryMapper.selectByPrimaryKey(repostoryId);
    }

    public int updateByPrimaryKeySelective(Repostory record){
    	return repostoryMapper.updateByPrimaryKeySelective(record);
    }

    public int updateByPrimaryKey(Repostory record){
    	return repostoryMapper.updateByPrimaryKey(record);
    }
	
	public List<RepostoryVo> querySelective(Map<String, Object> params){
		return repostoryMapper.querySelective(params);
	}
}
