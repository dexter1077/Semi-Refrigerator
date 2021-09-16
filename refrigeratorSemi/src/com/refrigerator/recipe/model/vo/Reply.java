package com.refrigerator.recipe.model.vo;

import java.util.Date;

/**
 * 
 * @author seong
 * @date 0528
 */




public class Reply {

	 private int replyNo;
	 private String replyWriter;
	 private int recipeNo;
	 private String replyContent;
	 private String enrollDate;
	 private Date modifyDate;
	 private String deleteStatus;
	 private String reportStatus;
	 
	 public Reply() {}



	public Reply(int replyNo, String replyWriter, int recipeNo, String replyContent, String enrollDate, Date modifyDate,
			String deleteStatus, String reportStatus) {
		super();
		this.replyNo = replyNo;
		this.replyWriter = replyWriter;
		this.recipeNo = recipeNo;
		this.replyContent = replyContent;
		this.enrollDate = enrollDate;
		this.modifyDate = modifyDate;
		this.deleteStatus = deleteStatus;
		this.reportStatus = reportStatus;
	}



	public Reply(int replyNo, String replyWriter, String enrollDate,String replyContent) {
		super();
		this.replyNo = replyNo;
		this.replyWriter = replyWriter;
		this.enrollDate = enrollDate;
		this.replyContent = replyContent;
		
	}

	public int getReplyNo() {
		return replyNo;
	}

	public void setReplyNo(int replyNo) {
		this.replyNo = replyNo;
	}

	public String getReplyWriter() {
		return replyWriter;
	}

	public void setReplyWriter(String replyWriter) {
		this.replyWriter = replyWriter;
	}



	public int getRecipeNo() {
		return recipeNo;
	}



	public void setRecipeNo(int recipeNo) {
		this.recipeNo = recipeNo;
	}



	public String getReplyContent() {
		return replyContent;
	}

	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}

	public String getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(String enrollDate) {
		this.enrollDate = enrollDate;
	}

	public Date getModifyDate() {
		return modifyDate;
	}

	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}

	public String getDeleteStatus() {
		return deleteStatus;
	}

	public void setDeleteStatus(String deleteStatus) {
		this.deleteStatus = deleteStatus;
	}

	public String getReportStatus() {
		return reportStatus;
	}

	public void setReportStatus(String reportStatus) {
		this.reportStatus = reportStatus;
	}

	@Override
	public String toString() {
		return "Reply [replyNo=" + replyNo + ", replyWriter=" + replyWriter + ", recipeNo=" + recipeNo
				+ ", replyContent=" + replyContent + ", enrollDate=" + enrollDate + ", modifyDate=" + modifyDate
				+ ", deleteStatus=" + deleteStatus + ", reportStatus=" + reportStatus + "]";
	}

	
	
	
	
}
