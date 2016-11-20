package com.fruit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fruit.dao.mysql.RepostoryMapper;
import com.fruit.model.Repostory;
import com.fruit.model.vo.RepostoryVo;

@Service("repostoryService")
public class RepostoryService {

	@Autowired
	private RepostoryMapper repostoryMapper;
	
	public List<RepostoryVo> querySelective(Repostory repostory){
		return repostoryMapper.querySelective(repostory);
	}
}
