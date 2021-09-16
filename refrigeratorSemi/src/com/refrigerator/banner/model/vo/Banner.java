package com.refrigerator.banner.model.vo;

import java.sql.Date;

/** @author Jaewon */

public class Banner {
	private int bannerNo;
	private String bannerName;
	private String companyName;
	private String bannerCategory;
	private String bannerStatus;
	private Date enrollDate;
	private Date modifyDate;
	private String startDate;
	private String endDate;
	private String bannerImg;
	private String page;
	
	public Banner() {}
	
	public Banner(int bannerNo, String bannerName, String companyName, String bannerCategory, String bannerStatus,
			Date enrollDate, Date modifyDate, String startDate, String endDate, String bannerImg, String page) {
		super();
		this.bannerNo = bannerNo;
		this.bannerName = bannerName;
		this.companyName = companyName;
		this.bannerCategory = bannerCategory;
		this.bannerStatus = bannerStatus;
		this.enrollDate = enrollDate;
		this.modifyDate = modifyDate;
		this.startDate = startDate;
		this.endDate = endDate;
		this.bannerImg = bannerImg;
		this.page = page;
	}

	public Banner(int bannerNo, String bannerName, String companyName, String bannerCategory, String bannerStatus,
			String startDate, String endDate, String bannerImg, String page) {
		super();
		this.bannerNo = bannerNo;
		this.bannerName = bannerName;
		this.companyName = companyName;
		this.bannerCategory = bannerCategory;
		this.bannerStatus = bannerStatus;
		this.startDate = startDate;
		this.endDate = endDate;
		this.bannerImg = bannerImg;
		this.page = page;
	}

	public Banner(String bannerName, String companyName, String bannerCategory, String bannerStatus, String startDate,
			String endDate, String bannerImg, String page) {
		super();
		this.bannerName = bannerName;
		this.companyName = companyName;
		this.bannerCategory = bannerCategory;
		this.bannerStatus = bannerStatus;
		this.startDate = startDate;
		this.endDate = endDate;
		this.bannerImg = bannerImg;
		this.page = page;
	}
	
	
	
	public Banner(String bannerName, String bannerImg, String page) {
		super();
		this.bannerName = bannerName;
		this.bannerImg = bannerImg;
		this.page = page;
	}

	/** 배너 레시피 등록
	 * @author daeun
	 */
	public Banner(int bannerNo, String bannerCategory, String bannerName, String companyName, String bannerStatus,
			String startDate, String endDate, String bannerImg) {
		super();
		this.bannerNo = bannerNo;
		this.bannerCategory = bannerCategory;
		this.bannerName = bannerName;
		this.companyName = companyName;
		this.bannerStatus = bannerStatus;
		this.startDate = startDate;
		this.endDate = endDate;
		this.bannerImg = bannerImg;
	}
	
	public int getBannerNo() {
		return bannerNo;
	}

	public void setBannerNo(int bannerNo) {
		this.bannerNo = bannerNo;
	}

	public String getBannerName() {
		return bannerName;
	}

	public void setBannerName(String bannerName) {
		this.bannerName = bannerName;
	}

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public String getBannerCategory() {
		return bannerCategory;
	}

	public void setBannerCategory(String bannerCategory) {
		this.bannerCategory = bannerCategory;
	}

	public String getBannerStatus() {
		return bannerStatus;
	}

	public void setBannerStatus(String bannerStatus) {
		this.bannerStatus = bannerStatus;
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

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public String getBannerImg() {
		return bannerImg;
	}

	public void setBannerImg(String bannerImg) {
		this.bannerImg = bannerImg;
	}

	public String getPage() {
		return page;
	}

	public void setPage(String page) {
		this.page = page;
	}

	@Override
	public String toString() {
		return "Banner [bannerNo=" + bannerNo + ", bannerName=" + bannerName + ", companyName=" + companyName
				+ ", bannerCategory=" + bannerCategory + ", bannerStatus=" + bannerStatus + ", enrollDate=" + enrollDate
				+ ", modifyDate=" + modifyDate + ", startDate=" + startDate + ", endDate=" + endDate + ", bannerImg="
				+ bannerImg + ", page=" + page + "]";
	}
	
	
}
