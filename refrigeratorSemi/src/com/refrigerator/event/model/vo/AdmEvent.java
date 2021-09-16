package com.refrigerator.event.model.vo;

import java.sql.Date;

public class AdmEvent {
	
	 private int eventNo;
	 private String eventTitle;
	 private String eventCategory;
	 private String startDate;
	 private String endDate;
	 private  Date enrollDate;
	 private String status;
	 private String eventImg;
	

	public AdmEvent() {}


	public AdmEvent(int eventNo, String eventTitle, String eventCategory, String startDate, String endDate,
			Date enrollDate, String status, String eventImg) {
		super();
		this.eventNo = eventNo;
		this.eventTitle = eventTitle;
		this.eventCategory = eventCategory;
		this.startDate = startDate;
		this.endDate = endDate;
		this.enrollDate = enrollDate;
		this.status = status;
		this.eventImg = eventImg;
	}


	public AdmEvent(int eventNo, String eventTitle, String eventCategory, String startDate, String endDate,
			Date enrollDate, String status) {
		super();
		this.eventNo = eventNo;
		this.eventTitle = eventTitle;
		this.eventCategory = eventCategory;
		this.startDate = startDate;
		this.endDate = endDate;
		this.enrollDate = enrollDate;
		this.status = status;
	}


	public int getEventNo() {
		return eventNo;
	}


	public void setEventNo(int eventNo) {
		this.eventNo = eventNo;
	}


	public String getEventTitle() {
		return eventTitle;
	}


	public void setEventTitle(String eventTitle) {
		this.eventTitle = eventTitle;
	}


	public String getEventCategory() {
		return eventCategory;
	}


	public void setEventCategory(String eventCategory) {
		this.eventCategory = eventCategory;
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


	public String getEventImg() {
		return eventImg;
	}


	public void setEventImg(String eventImg) {
		this.eventImg = eventImg;
	}


	@Override
	public String toString() {
		return "AdmEvent [eventNo=" + eventNo + ", eventTitle=" + eventTitle + ", eventCategory=" + eventCategory
				+ ", startDate=" + startDate + ", endDate=" + endDate + ", enrollDate=" + enrollDate + ", status="
				+ status + ", eventImg=" + eventImg + "]";
	}







	
	 
}
