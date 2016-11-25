package com.fruit.model.vo;

import com.fruit.model.GoodsType;

public class GoodsTypeVo extends GoodsType {
	private Integer pageNo;
	
	private Integer pageSize = 10;

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
}
