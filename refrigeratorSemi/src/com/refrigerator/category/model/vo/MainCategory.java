package com.refrigerator.category.model.vo;

public class MainCategory {

	/** @author Jaewon */

	private int categoryMainNo;
	private String categoryName;

	public MainCategory() {}

	public MainCategory(int categoryMainNo, String categoryName) {
		super();
		this.categoryMainNo = categoryMainNo;
		this.categoryName = categoryName;
	}

	public int getCategoryMainNo() {
		return categoryMainNo;
	}

	public void setCategoryMainNo(int categoryMainNo) {
		this.categoryMainNo = categoryMainNo;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	@Override
	public String toString() {
		return "MainCategory [categoryMainNo=" + categoryMainNo + ", categoryName=" + categoryName + "]";
	}
	
}
