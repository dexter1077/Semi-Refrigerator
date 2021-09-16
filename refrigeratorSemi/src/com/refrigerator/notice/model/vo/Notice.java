package com.refrigerator.notice.model.vo;

import java.sql.Date;

public class Notice {
	
	private int noticeNo;
	private String userNo;
	private String noticeTitle;
	private String noticeContent;
	private String deleteStatus;
	private Date enrollDate;
	private Date modifyDate;
	private int count;

	public Notice() {}

	public Notice(int noticeNo, String userNo, String noticeTitle, String noticeContent, String deleteStatus,
			Date enrollDate, Date modifyDate, int count) {
		super();
		this.noticeNo = noticeNo;
		this.userNo = userNo;
		this.noticeTitle = noticeTitle;
		this.noticeContent = noticeContent;
		this.deleteStatus = deleteStatus;
		this.enrollDate = enrollDate;
		this.modifyDate = modifyDate;
		this.count = count;
	}

	public Notice(int noticeNo, String noticeTitle, String userNo, Date enrollDate, Date modifyDate, int count) {
		super();
		this.noticeNo = noticeNo;
		this.noticeTitle = noticeTitle;
		this.userNo = userNo;
		this.enrollDate = enrollDate;
		this.modifyDate = modifyDate;
		this.count = count;
	}

	public Notice(int noticeNo,  String noticeTitle, String userNo,Date enrollDate, int count) {
		super();
		this.noticeNo = noticeNo;
		this.userNo = userNo;
		this.noticeTitle = noticeTitle;
		this.enrollDate = enrollDate;
		this.count = count;
	}

	public Notice(String userNo, String noticeTitle, String noticeContent, Date enrollDate, Date modifyDate,
			int count) {
		super();
		this.userNo = userNo;
		this.noticeTitle = noticeTitle;
		this.noticeContent = noticeContent;
		this.enrollDate = enrollDate;
		this.modifyDate = modifyDate;
		this.count = count;
	}
	
	

	public Notice(int noticeNo, String userNo, String noticeTitle, String noticeContent, Date modifyDate) {
		super();
		this.noticeNo = noticeNo;
		this.userNo = userNo;
		this.noticeTitle = noticeTitle;
		this.noticeContent = noticeContent;
		this.modifyDate = modifyDate;
	}

	public int getNoticeNo() {
		return noticeNo;
	}

	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}

	public String getUserNo() {
		return userNo;
	}

	public void setUserNo(String userNo) {
		this.userNo = userNo;
	}

	public String getNoticeTitle() {
		return noticeTitle;
	}

	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}

	public String getNoticeContent() {
		return noticeContent;
	}

	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}

	public String getDeleteStatus() {
		return deleteStatus;
	}

	public void setDeleteStatus(String deleteStatus) {
		this.deleteStatus = deleteStatus;
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

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	@Override
	public String toString() {
		return "Notice [noticeNo=" + noticeNo + ", userNo=" + userNo + ", noticeTitle=" + noticeTitle
				+ ", noticeContent=" + noticeContent + ", deleteStatus=" + deleteStatus + ", enrollDate=" + enrollDate
				+ ", modifyDate=" + modifyDate + ", count=" + count + "]";
	}
	
	
}
