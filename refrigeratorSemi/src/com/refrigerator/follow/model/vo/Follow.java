package com.refrigerator.follow.model.vo;

import java.sql.Date;

/**
 * @author HeeRak
 */
public class Follow {
	
	private int followNo;		// 팔로우 관계 구분번호
	private int followUserNo;   // 팔로우 하는 사람
	private int followingUserNo; // 팔로우 당하는 사람
	private Date enrollDate;
	private Date modifyDate;
	
	public Follow () {}
	
	public Follow(int followNo, int followUserNo, int followingUserNo, Date modifyDate) {
		super();
		this.followNo = followNo;
		this.followUserNo = followUserNo;
		this.followingUserNo = followingUserNo;
		this.modifyDate = modifyDate;
	}

	public Follow(int followNo, int followUserNo, int followingUserNo, Date enrollDate, Date modifyDate) {
		super();
		this.followNo = followNo;
		this.followUserNo = followUserNo;
		this.followingUserNo = followingUserNo;
		this.enrollDate = enrollDate;
		this.modifyDate = modifyDate;
	}

	public int getFollowNo() {
		return followNo;
	}

	public void setFollowNo(int followNo) {
		this.followNo = followNo;
	}

	public int getFollowUserNo() {
		return followUserNo;
	}

	public void setFollowUserNo(int followUserNo) {
		this.followUserNo = followUserNo;
	}

	public int getFollowingUserNo() {
		return followingUserNo;
	}

	public void setFollowingUserNo(int followingUserNo) {
		this.followingUserNo = followingUserNo;
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
		return "Follow [followNo=" + followNo + ", followUserNo=" + followUserNo + ", followingUserNo="
				+ followingUserNo + ", enrollDate=" + enrollDate + ", modifyDate=" + modifyDate + "]";
	}
	
}
