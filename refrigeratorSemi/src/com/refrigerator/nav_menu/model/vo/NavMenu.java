package com.refrigerator.nav_menu.model.vo;

/** @author Jaewon */

public class NavMenu {
	
	private int menuNo;
	private String menuName;
	private int menuOrder;

	public NavMenu() {}
	
	public NavMenu(int menuNo, String menuName, int menuOrder) {
		super();
		this.menuNo = menuNo;
		this.menuName = menuName;
		this.menuOrder = menuOrder;
	}

	public int getMenuNo() {
		return menuNo;
	}

	public void setMenuNo(int menuNo) {
		this.menuNo = menuNo;
	}

	public String getMenuName() {
		return menuName;
	}

	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}

	public int getMenuOrder() {
		return menuOrder;
	}

	public void setMenuOrder(int menuOrder) {
		this.menuOrder = menuOrder;
	}

	@Override
	public String toString() {
		return "NavMenu [menuNo=" + menuNo + ", menuName=" + menuName + ", menuOrder=" + menuOrder + "]";
	}
	
}
