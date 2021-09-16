package com.refrigerator.recent_recipe.model.vo;

/** @author Jaewon */

public class RecentRecipe {
	private int recipeNo;  
	private String recipeTitle; 
	private int cookingTime; 
	private int likeCount; 
	private String mainImg;	
	private String nickName; 
	private String profileImg; 
	private double avgStar; 
	
	public RecentRecipe() {}
	
	public RecentRecipe(int recipeNo, String recipeTitle, int cookingTime, int likeCount, String mainImg,
			String nickName, String profileImg, double avgStar) {
		super();
		this.recipeNo = recipeNo;
		this.recipeTitle = recipeTitle;
		this.cookingTime = cookingTime;
		this.likeCount = likeCount;
		this.mainImg = mainImg;
		this.nickName = nickName;
		this.profileImg = profileImg;
		this.avgStar = avgStar;
	}

	public int getRecipeNo() {
		return recipeNo;
	}

	public void setRecipeNo(int recipeNo) {
		this.recipeNo = recipeNo;
	}

	public String getRecipeTitle() {
		return recipeTitle;
	}

	public void setRecipeTitle(String recipeTitle) {
		this.recipeTitle = recipeTitle;
	}

	public int getCookingTime() {
		return cookingTime;
	}

	public void setCookingTime(int cookingTime) {
		this.cookingTime = cookingTime;
	}

	public int getLikeCount() {
		return likeCount;
	}

	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}

	public String getMainImg() {
		return mainImg;
	}

	public void setMainImg(String mainImg) {
		this.mainImg = mainImg;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getProfileImg() {
		return profileImg;
	}

	public void setProfileImg(String profileImg) {
		this.profileImg = profileImg;
	}

	public double getAvgStar() {
		return avgStar;
	}

	public void setAvgStar(double avgStar) {
		this.avgStar = avgStar;
	}

	@Override
	public String toString() {
		return "RecentRecipe [recipeNo=" + recipeNo + ", recipeTitle=" + recipeTitle + ", cookingTime=" + cookingTime
				+ ", likeCount=" + likeCount + ", mainImg=" + mainImg + ", nickName=" + nickName + ", profileImg="
				+ profileImg + ", avgStar=" + avgStar + "]";
	}
	
	
}
