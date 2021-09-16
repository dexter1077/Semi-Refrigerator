package com.refrigerator.ingre_search.model.vo;

/**
 * 검색버튼데이터 저장객체
 * @author HeeRak
 */
public class IngreSearch {
	
	private int ingredientSearch;
	private int recipeNo;
	private int categorySno;
	private String categoryName; // @author seong
	private String ingreName; // @author seong
	
	public IngreSearch(){}
	
	public IngreSearch(int ingredientSearch, int categorySno) {
		super();
		this.ingredientSearch = ingredientSearch;
		this.categorySno = categorySno;
	}


	public IngreSearch(int ingredientSearch, int recipeNo, int categorySno) {
		super();
		this.ingredientSearch = ingredientSearch;
		this.recipeNo = recipeNo;
		this.categorySno = categorySno;
	}
	
	/**
	 * 레시피 상세 페이지에 재료 버튼 
	 * @author seong
	 * @6/5
	 * @return
	 */
	
	public IngreSearch(int ingredientSearch, int recipeNo, String categoryName, String ingreName) {
		super();
		this.ingredientSearch = ingredientSearch;
		this.recipeNo = recipeNo;
		this.categoryName = categoryName;
		this.ingreName = ingreName;
	}
	
	
	/**
	 * 
	 * @return
	 */
	public IngreSearch(int ingredientSearch, int recipeNo, int categorySno, String categoryName, String ingreName) {
		super();
		this.ingredientSearch = ingredientSearch;
		this.recipeNo = recipeNo;
		this.categorySno = categorySno;
		this.categoryName = categoryName;
		this.ingreName = ingreName;
	}


	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public String getIngreName() {
		return ingreName;
	}

	public void setIngreName(String ingreName) {
		this.ingreName = ingreName;
	}

	public int getIngredientSearch() {
		return ingredientSearch;
	}

	public void setIngredientSearch(int ingredientSearch) {
		this.ingredientSearch = ingredientSearch;
	}

	public int getRecipeNo() {
		return recipeNo;
	}

	public void setRecipeNo(int recipeNo) {
		this.recipeNo = recipeNo;
	}

	public int getCategorySno() {
		return categorySno;
	}

	public void setCategorySno(int categorySno) {
		this.categorySno = categorySno;
	}

	@Override
	public String toString() {
		return "IngreSearch [ingredientSearch=" + ingredientSearch + ", recipeNo=" + recipeNo + ", categorySno="
				+ categorySno + ", categoryName=" + categoryName + ", ingreName=" + ingreName + "]";
	}


	
	
}
