package com.refrigerator.review.model.vo;

import java.sql.Date;

/**
 * @author HeeRak
 *
 */
public class Review {
	
	private int reviewNo;
	private int userNo;
	private int recipeNo;
	private String reviewWriter; // 성은추가
	private String reviewContent;
	private double star;
	private String reviewImg; // 성은추가
	private String imgName;
	private Date enrollDate;
	private Date modifyDate;
	private String profileImg;
	
	public Review() {}

	
	public Review(int reviewNo, String reviewContent, double star, String imgName) {
		super();
		this.reviewNo = reviewNo;
		this.reviewContent = reviewContent;
		this.star = star;
		this.imgName = imgName;
	}


	public Review(int reviewNo, int userNo, String reivewContent, double star, String imgName, Date modifyDate) {
		super();
		this.reviewNo = reviewNo;
		this.userNo = userNo;
		this.reviewContent = reivewContent;
		this.star = star;
		this.imgName = imgName;
		this.modifyDate = modifyDate;
	}


	public Review(int reviewNo, int userNo, int recipeNo, String reivewContent, double star, String imgName,
			Date modifyDate) {
		super();
		this.reviewNo = reviewNo;
		this.userNo = userNo;
		this.recipeNo = recipeNo;
		this.reviewContent = reivewContent;
		this.star = star;
		this.imgName = imgName;
		this.modifyDate = modifyDate;
	}

	public Review(int reviewNo, int userNo, int recipeNo, String reivewContent, double star, String imgName,
			Date enrollDate, Date modifyDate) {
		super();
		this.reviewNo = reviewNo;
		this.userNo = userNo;
		this.recipeNo = recipeNo;
		this.reviewContent = reivewContent;
		this.star = star;
		this.imgName = imgName;
		this.enrollDate = enrollDate;
		this.modifyDate = modifyDate;
	}
	
	/**
	 * 레시피 후기 상세 조회하기 기능 
	 * @author seong
	 */
	public Review(int reviewNo, String reviewWriter, String reviewContent, double star, String reviewImg,
			Date enrollDate, String profileImg) {
		super();
		this.reviewNo = reviewNo;
		this.reviewWriter = reviewWriter;
		this.reviewContent = reviewContent;
		this.star = star;
		this.reviewImg = reviewImg;
		this.enrollDate = enrollDate;
		this.profileImg = profileImg;
	}
	
	

	public String getReviewWriter() {
		return reviewWriter;
	}


	public void setReviewWriter(String reviewWriter) {
		this.reviewWriter = reviewWriter;
	}


	public String getReviewImg() {
		return reviewImg;
	}


	public void setReviewImg(String reviewImg) {
		this.reviewImg = reviewImg;
	}


	public String getProfileImg() {
		return profileImg;
	}


	public void setProfileImg(String profileImg) {
		this.profileImg = profileImg;
	}


	public int getReviewNo() {
		return reviewNo;
	}

	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getRecipeNo() {
		return recipeNo;
	}

	public void setRecipeNo(int recipeNo) {
		this.recipeNo = recipeNo;
	}

	public String getReviewContent() {
		return reviewContent;
	}

	public void setReviewContent(String reivewContent) {
		this.reviewContent = reivewContent;
	}

	public double getStar() {
		return star;
	}

	public void setStar(double star) {
		this.star = star;
	}

	public String getImgName() {
		return imgName;
	}

	public void setImgName(String imgName) {
		this.imgName = imgName;
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
		return "Review [reviewNo=" + reviewNo + ", userNo=" + userNo + ", recipeNo=" + recipeNo + ", reviewWriter="
				+ reviewWriter + ", reviewContent=" + reviewContent + ", star=" + star + ", reviewImg=" + reviewImg
				+ ", imgName=" + imgName + ", enrollDate=" + enrollDate + ", modifyDate=" + modifyDate + ", profileImg="
				+ profileImg + "]";
	}


	
	
	
	
}
