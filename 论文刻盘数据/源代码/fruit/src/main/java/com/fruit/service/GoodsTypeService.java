package com.fruit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fruit.dao.mysql.GoodsTypeMapper;
import com.fruit.model.vo.GoodsTypeVo;

@Service("goodsTypeService")
public class GoodsTypeService {

	@Autowired
	private GoodsTypeMapper goodsTypeMapper;
	
	public List<GoodsTypeVo> selectByParam(GoodsTypeVo goodsTypeVo){
		return goodsTypeMapper.selectByParam(goodsTypeVo);
	}
	
	
}
