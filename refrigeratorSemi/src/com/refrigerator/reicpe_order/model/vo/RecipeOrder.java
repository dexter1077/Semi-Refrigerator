package com.refrigerator.reicpe_order.model.vo;

/**
 * @author HeeRak
 */
public class RecipeOrder {
	
	private int recipeOrderNo;
	private int recipeNo;
	private int recipeOrder;
	private String recipeExpln;
	private String recipeImg;
	
	public RecipeOrder() {}
	
	public RecipeOrder(int recipeOrder, String recipeExpln) {
		super();
		this.recipeOrder = recipeOrder;
		this.recipeExpln = recipeExpln;
	}
	
	public RecipeOrder(int recipeOrder, String recipeExpln, String recipeImg) {
		super();
		this.recipeOrder = recipeOrder;
		this.recipeExpln = recipeExpln;
		this.recipeImg = recipeImg;
	}

	public RecipeOrder(int recipeOrderNo, int recipeNo, int recipeOrder, String recipeExpln, String recipeImg) {
		super();
		this.recipeOrderNo = recipeOrderNo;
		this.recipeNo = recipeNo;
		this.recipeOrder = recipeOrder;
		this.recipeExpln = recipeExpln;
		this.recipeImg = recipeImg;
	}

	public int getRecipeOrderNo() {
		return recipeOrderNo;
	}

	public void setRecipeOrderNo(int recipeOrderNo) {
		this.recipeOrderNo = recipeOrderNo;
	}

	public int getRecipeNo() {
		return recipeNo;
	}

	public void setRecipeNo(int recipeNo) {
		this.recipeNo = recipeNo;
	}

	public int getRecipeOrder() {
		return recipeOrder;
	}

	public void setRecipeOrder(int recipeOrder) {
		this.recipeOrder = recipeOrder;
	}

	public String getRecipeExpln() {
		return recipeExpln;
	}

	public void setRecipeExpln(String recipeExpln) {
		this.recipeExpln = recipeExpln;
	}

	public String getRecipeImg() {
		return recipeImg;
	}

	public void setRecipeImg(String recipeImg) {
		this.recipeImg = recipeImg;
	}

	@Override
	public String toString() {
		return "RecipeOrder [recipeOrderNo=" + recipeOrderNo + ", recipeNo=" + recipeNo + ", recipeOrder=" + recipeOrder
				+ ", recipeExpln=" + recipeExpln + ", recipeImg=" + recipeImg + "]";
	}
	
	
}
