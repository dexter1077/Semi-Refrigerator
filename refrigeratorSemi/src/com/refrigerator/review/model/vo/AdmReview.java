package com.refrigerator.review.model.vo;

import java.sql.Date;

public class AdmReview {

	 private int reviewNo;
	 private String reviewWirter;
	 private String recipeTitle;
	 private double star;
	 private String reviewContent;
	 private Date enrollDate;
	
	 public AdmReview() {}

	public AdmReview(int reviewNo, String reviewWirter, String recipeTitle, double star, String reviewContent,
			Date enrollDate) {
		super();
		this.reviewNo = reviewNo;
		this.reviewWirter = reviewWirter;
		this.recipeTitle = recipeTitle;
		this.star = star;
		this.reviewContent = reviewContent;
		this.enrollDate = enrollDate;
	}

	public int getReviewNo() {
		return reviewNo;
	}

	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}

	public String getReviewWirter() {
		return reviewWirter;
	}

	public void setReviewWirter(String reviewWirter) {
		this.reviewWirter = reviewWirter;
	}

	public String getRecipeTitle() {
		return recipeTitle;
	}

	public void setRecipeTitle(String recipeTitle) {
		this.recipeTitle = recipeTitle;
	}

	public double getStar() {
		return star;
	}

	public void setStar(double star) {
		this.star = star;
	}

	public String getReviewContent() {
		return reviewContent;
	}

	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	@Override
	public String toString() {
		return "AdmReview [reviewNo=" + reviewNo + ", reviewWirter=" + reviewWirter + ", recipeTitle=" + recipeTitle
				+ ", star=" + star + ", reviewContent=" + reviewContent + ", enrollDate=" + enrollDate + "]";
	}
	 
	 
	 
}
