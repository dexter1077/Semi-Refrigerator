package com.refrigerator.category.model.vo;

public class SubCategory {

	/** @author Jaewon */
	
	private int categorySubNo;
	private int categoryMainNo;
	private String ingredientName;

	public SubCategory() {}
	
	public SubCategory(int categorySubNo, String ingredientName) {
		super();
		this.categorySubNo = categorySubNo;
		this.ingredientName = ingredientName;
	}

	public SubCategory(int categorySubNo, int categoryMainNo, String ingredientName) {
		super();
		this.categorySubNo = categorySubNo;
		this.categoryMainNo = categoryMainNo;
		this.ingredientName = ingredientName;
	}

	public int getCategorySubNo() {
		return categorySubNo;
	}

	public void setCategorySubNo(int categorySubNo) {
		this.categorySubNo = categorySubNo;
	}

	public int getCategoryMainNo() {
		return categoryMainNo;
	}

	public void setCategoryMainNo(int categoryMainNo) {
		this.categoryMainNo = categoryMainNo;
	}

	public String getIngredientName() {
		return ingredientName;
	}

	public void setIngredientName(String ingredientName) {
		this.ingredientName = ingredientName;
	}

	@Override
	public String toString() {
		return "SubCategory [categorySubNo=" + categorySubNo + ", categoryMainNo=" + categoryMainNo
				+ ", ingredientName=" + ingredientName + "]";
	}
	
}
