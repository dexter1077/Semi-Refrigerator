package com.refrigerator.member.model.vo;

import java.sql.Date;

public class Member {
	
	private int userNo;
	private String userId;
	private String userPwd;
	private String userName;
	private String userType;
	private String grade;
	private String birthday;
	private String gender;
	private String email;
	private String phone;
	private String profileImg;
	private String nickname;
	private String intro;
	private Date modifyDate;
	private int scrapCount;
	private int likeCount;
	private int folCount;
	private Date enrollDate;
	private String status;
	
	public Member() {}
	
	public Member(int userNo, String userId, String userPwd, String userName, String userType, String grade,
			String birthday, String gender, String email, String phone, String profileImg, String nickname,
			String intro, Date modifyDate, int scrapCount, int likeCount, int folCount, Date enrollDate,
			String status) {
		super();
		this.userNo = userNo;
		this.userId = userId;
		this.userPwd = userPwd;
		this.userName = userName;
		this.userType = userType;
		this.grade = grade;
		this.birthday = birthday;
		this.gender = gender;
		this.email = email;
		this.phone = phone;
		this.profileImg = profileImg;
		this.nickname = nickname;
		this.intro = intro;
		this.modifyDate = modifyDate;
		this.scrapCount = scrapCount;
		this.likeCount = likeCount;
		this.folCount = folCount;
		this.enrollDate = enrollDate;
		this.status = status;
	}
	

	public Member(String userId, String nickname, String userPwd, String userName, String birthday, String gender, String email, String profileImg) {
		super();
		this.userId = userId;
		this.nickname = nickname;
		this.userPwd = userPwd;
		this.userName = userName;
		this.birthday = birthday;
		this.gender = gender;
		this.email = email;
		this.profileImg = profileImg;
	}
	
	public Member(int userNo, String userId, String userName, String grade, String gender, String email, String phone,
			String nickname, String status) {
		super();
		this.userNo = userNo;
		this.userId = userId;
		this.userName = userName;
		this.grade = grade;
		this.gender = gender;
		this.email = email;
		this.phone = phone;
		this.nickname = nickname;
		this.status = status;
	}
	
	public Member(String userId, String userName, String email, String phone, Date enrollDate) {
		super();
		this.userId = userId;
		this.userName = userName;
		this.email = email;
		this.phone = phone;
		this.enrollDate = enrollDate;
	}

	public Member(String userPwd, String userName, String grade, String gender, String email, String phone,
			String nickname) {
		super();
		this.userPwd = userPwd;
		this.userName = userName;
		this.grade = grade;
		this.gender = gender;
		this.email = email;
		this.phone = phone;
		this.nickname = nickname;
	}
	
	public Member(int userNo, String userName, String gender, String email, String phone) {
		super();
		this.userNo = userNo;
		this.userName = userName;
		this.gender = gender;
		this.email = email;
		this.phone = phone;
	}

	public Member(int userNo, String userId, String userName, String userType, String grade, String gender,
			String email, String phone, String nickname, String status) {
		super();
		this.userNo = userNo;
		this.userId = userId;
		this.userName = userName;
		this.userType = userType;
		this.grade = grade;
		this.gender = gender;
		this.email = email;
		this.phone = phone;
		this.nickname = nickname;
		this.status = status;
	}
	
	public Member(int userNo) {
		super();
		this.userNo = userNo;
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

	public String getUserPwd() {
		return userPwd;
	}

	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserType() {
		return userType;
	}

	public void setUserType(String userType) {
		this.userType = userType;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
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

	public String getIntro() {
		return intro;
	}

	public void setIntro(String intro) {
		this.intro = intro;
	}

	public Date getModifyDate() {
		return modifyDate;
	}

	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
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

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Member [userNo=" + userNo + ", userId=" + userId + ", userPwd=" + userPwd + ", userName=" + userName
				+ ", userType=" + userType + ", grade=" + grade + ", birthday=" + birthday + ", gender=" + gender
				+ ", email=" + email + ", phone=" + phone + ", profileImg=" + profileImg + ", nickname=" + nickname
				+ ", intro=" + intro + ", modifyDate=" + modifyDate + ", scrapCount=" + scrapCount + ", likeCount="
				+ likeCount + ", folCount=" + folCount + ", enrollDate=" + enrollDate + ", status=" + status + "]";
	}
	
	

}
 