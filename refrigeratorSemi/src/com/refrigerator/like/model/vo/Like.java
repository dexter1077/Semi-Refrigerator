package com.refrigerator.like.model.vo;

import java.sql.Date;

public class Like {
	
	private int recipeNo;
	private int userNo;
	private String userId;
	private Date likeDate;
	private String status;
	
	public Like(int recipeNo, int userNo, String userId, Date likeDate, String status) {
		super();
		this.recipeNo = recipeNo;
		this.userNo = userNo;
		this.userId = userId;
		this.likeDate = likeDate;
		this.status = status;
	}

	public int getRecipeNo() {
		return recipeNo;
	}

	public void setRecipeNo(int recipeNo) {
		this.recipeNo = recipeNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public Date getLikeDate() {
		return likeDate;
	}

	public void setLikeDate(Date likeDate) {
		this.likeDate = likeDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Like [recipeNo=" + recipeNo + ", userNo=" + userNo + ", userId=" + userId + ", likeDate=" + likeDate
				+ ", status=" + status + "]";
	}
	
	

}
