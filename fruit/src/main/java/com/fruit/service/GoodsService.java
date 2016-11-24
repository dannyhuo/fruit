package com.fruit.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fruit.dao.mysql.GoodsMapper;
import com.fruit.model.Goods;
import com.fruit.model.vo.GoodsVo;

@Service("goodsService")
public class GoodsService {
	
	@Autowired
	private GoodsMapper goodsMapper;
	
	public int deleteByPrimaryKey(Long goodsId){
		return goodsMapper.deleteByPrimaryKey(goodsId);
	}

	public int insert(Goods record){
		return goodsMapper.insert(record);
	}

	public int insertSelective(Goods record){
		return goodsMapper.insertSelective(record);
	}

	public Goods selectByPrimaryKey(Long goodsId){
		return goodsMapper.selectByPrimaryKey(goodsId);
	}

	public int updateByPrimaryKeySelective(Goods record){
		return goodsMapper.updateByPrimaryKeySelective(record);
	}

	public int updateByPrimaryKey(Goods record){
		return goodsMapper.updateByPrimaryKey(record);
	}
	
	public List<GoodsVo> selectByParam(Map<String, Object> params){
		return goodsMapper.selectByParam(params);
	}
	
	public Long selectCountByParam(Map<String, Object> params){
		return goodsMapper.selectCountByParam(params);
	}
	
	/**
	 * 按关键字搜索，如果关键字为空
	 * @param goodsVo
	 * @return
	 */
	public List<GoodsVo> searchByKeyWords(Map<String, Object> params){
		if(null == params || null == params.get("keyWords")
				|| params.get("keyWords").toString().trim().equals("")){
			return goodsMapper.search(params);
		}
		return null;
	}
	
	public long searchCountByKeyWords(Map<String, Object> params){
		return goodsMapper.searchCount(params);
	}

}
