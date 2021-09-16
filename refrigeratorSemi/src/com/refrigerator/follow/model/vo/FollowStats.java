package com.refrigerator.follow.model.vo;

public class FollowStats {
	
	private int followingUserNo;
	private String profileImg;
	private String nickname;
	private int scrapCount;
	private int likeCount;
	private int folCount;
	
	private int userRecipeCount;
	private double userAvgStar;
	
	public FollowStats() {}
	
	public FollowStats(int userRecipeCount, double userAvgStar) {
		super();
		this.userRecipeCount = userRecipeCount;
		this.userAvgStar = userAvgStar;
	}

	public FollowStats(int followingUserNo, String profileImg, String nickname, int scrapCount, int likeCount,
			int folCount, int userRecipeCount, double userAvgStar) {
		super();
		this.followingUserNo = followingUserNo;
		this.profileImg = profileImg;
		this.nickname = nickname;
		this.scrapCount = scrapCount;
		this.likeCount = likeCount;
		this.folCount = folCount;
		this.userRecipeCount = userRecipeCount;
		this.userAvgStar = userAvgStar;
	}


	public FollowStats(int followingUserNo, String profileImg, String nickname, int scrapCount, int likeCount,
			int folCount) {
		super();
		this.followingUserNo = followingUserNo;
		this.profileImg = profileImg;
		this.nickname = nickname;
		this.scrapCount = scrapCount;
		this.likeCount = likeCount;
		this.folCount = folCount;
	}

	public int getUserRecipeCount() {
		return userRecipeCount;
	}

	public void setUserRecipeCount(int userRecipeCount) {
		this.userRecipeCount = userRecipeCount;
	}

	public double getUserAvgStar() {
		return userAvgStar;
	}

	public void setUserAvgStar(double userAvgStar) {
		this.userAvgStar = userAvgStar;
	}

	public int getFollowingUserNo() {
		return followingUserNo;
	}

	public void setFollowingUserNo(int followingUserNo) {
		this.followingUserNo = followingUserNo;
	}

	public String getProfileImg() {
		return profileImg;
	}

	public void setProfileImg(String profileImg) {
		this.profileImg = profileImg;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public int getScrapCount() {
		return scrapCount;
	}

	public void setScrapCount(int scrapCount) {
		this.scrapCount = scrapCount;
	}

	public int getLikeCount() {
		return likeCount;
	}

	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}

	public int getFolCount() {
		return folCount;
	}

	public void setFolCount(int folCount) {
		this.folCount = folCount;
	}

	@Override
	public String toString() {
		return "FollowStats [followingUserNo=" + followingUserNo + ", profileImg=" + profileImg + ", nickname="
				+ nickname + ", scrapCount=" + scrapCount + ", likeCount=" + likeCount + ", folCount=" + folCount
				+ ", userRecipeCount=" + userRecipeCount + ", userAvgStar=" + userAvgStar + "]";
	}


	
}
