package com.fruit.model.vo;

import com.fruit.enu.Enums.GOODS_CATEGORY;
import com.fruit.model.Goods;

public class GoodsVo extends Goods{

	private Integer pageNo;
	
	private Integer pageSize = 10;
	
	private String keyWords;
	
	private boolean isSearchOr = true;

	public Integer getPageNo() {
		return pageNo;
	}

	public void setPageNo(Integer pageNo) {
		if(null == pageNo || pageNo > 0){
			this.pageNo = pageNo;
		}
	}

	public Integer getPageSize() {
		return pageSize;
	}

	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}
	
	
	public Integer getStartRow(){
		if(null != this.pageNo && null != this.pageSize){
			return (this.pageNo - 1) * pageSize;
		}else{
			return null;
		}
	}
	
	public String getGoodsCategoryName(){
		if(null != this.getGoodsCategory()){
			return GOODS_CATEGORY.getCnName(this.getGoodsCategory());
		}
		return null;
	}

	public String getKeyWords() {
		return keyWords;
	}

	public void setKeyWords(String keyWords) {
		if(null != keyWords){
			this.setGoodsName(keyWords);
			this.setDescription(keyWords);
			this.setTag(keyWords);
			this.setProducingArea(keyWords);
			this.setGoodsCategory(GOODS_CATEGORY.searchCodeLike(keyWords));
		}
		this.keyWords = keyWords;
	}

	public boolean isSearchOr() {
		return isSearchOr;
	}

	public void setSearchOr(boolean isSearchOr) {
		this.isSearchOr = isSearchOr;
	}
	
	
}
