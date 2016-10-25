package com.fruit.service;

import java.util.List;

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
	
	public List<GoodsVo> selectByParam(GoodsVo goodsVo){
		return goodsMapper.selectByParam(goodsVo);
	}
	
	/**
	 * 按关键字搜索，如果关键字为空，则将查询最前100条商品
	 * @param goodsVo
	 * @return
	 */
	public List<GoodsVo> searchByKeyWords(GoodsVo goodsVo){
		if(null == goodsVo || null == goodsVo.getKeyWords() 
				|| goodsVo.getKeyWords().trim().equals("")){
			goodsVo = new GoodsVo();
			goodsVo.setPageNo(1);
			goodsVo.setPageSize(100);
		}
		return goodsMapper.search(goodsVo);
	}

}
