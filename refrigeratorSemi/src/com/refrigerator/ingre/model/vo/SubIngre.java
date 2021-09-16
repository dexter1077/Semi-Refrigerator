package com.refrigerator.ingre.model.vo;

public class SubIngre {
	
	
	private int subIngreNo;
	private int subRecipeNo;
	private int subCategorySno;
	private String subIngreName; // 성은 추가
	private int subIngreAmount;
	private String subIngreUnit;
	private String subIngreCategory;
	
	public SubIngre() {}
	
	public SubIngre(int subIngreNo, int subRecipeNo, int subCategorySno, String subIngreName, int subIngreAmount,
			String subIngreUnit, String subIngreCategory) {
		super();
		this.subIngreNo = subIngreNo;
		this.subRecipeNo = subRecipeNo;
		this.subCategorySno = subCategorySno;
		this.subIngreName = subIngreName;
		this.subIngreAmount = subIngreAmount;
		this.subIngreUnit = subIngreUnit;
		this.subIngreCategory = subIngreCategory;
	}
	
	

	public SubIngre(int subIngreNo, int subRecipeNo, String subIngreName, int subIngreAmount, String subIngreUnit) {
		super();
		this.subIngreNo = subIngreNo;
		this.subRecipeNo = subRecipeNo;
		this.subIngreName = subIngreName;
		this.subIngreAmount = subIngreAmount;
		this.subIngreUnit = subIngreUnit;
	}

	public int getSubIngreNo() {
		return subIngreNo;
	}

	public void setSubIngreNo(int subIngreNo) {
		this.subIngreNo = subIngreNo;
	}

	public int getSubRecipeNo() {
		return subRecipeNo;
	}

	public void setSubRecipeNo(int subRecipeNo) {
		this.subRecipeNo = subRecipeNo;
	}

	public int getSubCategorySno() {
		return subCategorySno;
	}

	public void setSubCategorySno(int subCategorySno) {
		this.subCategorySno = subCategorySno;
	}

	public String getSubIngreName() {
		return subIngreName;
	}

	public void setSubIngreName(String subIngreName) {
		this.subIngreName = subIngreName;
	}

	public int getSubIngreAmount() {
		return subIngreAmount;
	}

	public void setSubIngreAmount(int subIngreAmount) {
		this.subIngreAmount = subIngreAmount;
	}

	public String getSubIngreUnit() {
		return subIngreUnit;
	}

	public void setSubIngreUnit(String subIngreUnit) {
		this.subIngreUnit = subIngreUnit;
	}

	public String getSubIngreCategory() {
		return subIngreCategory;
	}

	public void setSubIngreCategory(String subIngreCategory) {
		this.subIngreCategory = subIngreCategory;
	}

	@Override
	public String toString() {
		return "SubIngre [subIngreNo=" + subIngreNo + ", subRecipeNo=" + subRecipeNo + ", subCategorySno="
				+ subCategorySno + ", subIngreName=" + subIngreName + ", subIngreAmount=" + subIngreAmount
				+ ", subIngreUnit=" + subIngreUnit + ", subIngreCategory=" + subIngreCategory + "]";
	}
	
	
	
	

}
