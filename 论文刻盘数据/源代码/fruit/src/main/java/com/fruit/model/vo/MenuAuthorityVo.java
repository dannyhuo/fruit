package com.fruit.model.vo;

import com.fruit.model.MenuAuthority;

public class MenuAuthorityVo extends MenuAuthority{
	
	private String menuName;

    private String menuUrl;

	public String getMenuName() {
		return menuName;
	}

	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}

	public String getMenuUrl() {
		return menuUrl;
	}

	public void setMenuUrl(String menuUrl) {
		this.menuUrl = menuUrl;
	}
    

}
