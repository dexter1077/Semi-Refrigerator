package com.refrigerator.recipe.model.vo;

import java.sql.Date;

/**
 * 
 * @author seong
 * @date 0528
 */

public class Review {
	
	
	 private int reviewNo;
	 private String reviewWriter;
	 private int recipeNo;
	 private String reviewContent;
	 private double star;
	 private String reviewImg;
	 private Date enrollDate;
	 private Date modifyDate;

	 public Review() {}

	 
	public Review(int reviewNo, int recipeNo, String reviewContent, double star, String reviewImg, Date modifyDate) {
		super();
		this.reviewNo = reviewNo;
		this.recipeNo = recipeNo;
		this.reviewContent = reviewContent;
		this.star = star;
		this.reviewImg = reviewImg;
		this.modifyDate = modifyDate;
	}


	public Review(int reviewNo, String reviewWriter, int recipeNo, String reviewContent, double star, String reviewImg,
			Date enrollDate, Date modifyDate) {
		super();
		this.reviewNo = reviewNo;
		this.reviewWriter = reviewWriter;
		this.recipeNo = recipeNo;
		this.reviewContent = reviewContent;
		this.star = star;
		this.reviewImg = reviewImg;
		this.enrollDate = enrollDate;
		this.modifyDate = modifyDate;
	}

	public Review(int reviewNo, String reviewWriter, String reviewContent, double star, String reviewImg,
			Date enrollDate) {
		super();
		this.reviewNo = reviewNo;
		this.reviewWriter = reviewWriter;
		this.reviewContent = reviewContent;
		this.star = star;
		this.reviewImg = reviewImg;
		this.enrollDate = enrollDate;
	}

	

	public int getReviewNo() {
		return reviewNo;
	}

	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}

	public String getReviewWriter() {
		return reviewWriter;
	}

	public void setReviewWriter(String reviewWriter) {
		this.reviewWriter = reviewWriter;
	}

	
	
	public int getRecipeNo() {
		return recipeNo;
	}


	public void setRecipeNo(int recipeNo) {
		this.recipeNo = recipeNo;
	}


	public String getReviewImg() {
		return reviewImg;
	}


	public void setReviewImg(String reviewImg) {
		this.reviewImg = reviewImg;
	}


	public String getReviewContent() {
		return reviewContent;
	}

	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}

	public double getStar() {
		return star;
	}

	public void setStar(double star) {
		this.star = star;
	}


	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	public Date getModifyDate() {
		return modifyDate;
	}

	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}


	@Override
	public String toString() {
		return "Review [reviewNo=" + reviewNo + ", reviewWriter=" + reviewWriter + ", recipeNo=" + recipeNo
				+ ", reviewContent=" + reviewContent + ", star=" + star + ", reviewImg=" + reviewImg + ", enrollDate="
				+ enrollDate + ", modifyDate=" + modifyDate + "]";
	}


	
	
	
	
	 
}
