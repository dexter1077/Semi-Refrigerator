package com.refrigerator.reply.model.vo;

import java.sql.Date;

public class AdmReply {
	
		private String userId;
     	private int replyNo;
     	private String reportContent;
     	private String recipeTitle;
     	private String replyContent;
     	private Date enrollDate;
     	private String status;

     	
     	public AdmReply() {}

  
		
		public AdmReply(String userId, String reportContent, String recipeTitle, String replyContent, Date enrollDate,
				String status) {
			super();
			this.userId = userId;
			this.reportContent = reportContent;
			this.recipeTitle = recipeTitle;
			this.replyContent = replyContent;
			this.enrollDate = enrollDate;
			this.status = status;
		}



		public AdmReply(String userId, int replyNo, String reportContent, String recipeTitle, String replyContent,
				Date enrollDate, String status) {
			super();
			this.userId = userId;
			this.replyNo = replyNo;
			this.reportContent = reportContent;
			this.recipeTitle = recipeTitle;
			this.replyContent = replyContent;
			this.enrollDate = enrollDate;
			this.status = status;
		}



		public int getReplyNo() {
			return replyNo;
		}



		public void setReplyNo(int replyNo) {
			this.replyNo = replyNo;
		}



		public String getUserId() {
			return userId;
		}



		public void setUserId(String userId) {
			this.userId = userId;
		}



		public String getReportContent() {
			return reportContent;
		}

		public void setReportContent(String reportContent) {
			this.reportContent = reportContent;
		}

		public String getRecipeTitle() {
			return recipeTitle;
		}

		public void setRecipeTitle(String recipeTitle) {
			this.recipeTitle = recipeTitle;
		}

		public String getReplyContent() {
			return replyContent;
		}

		public void setReplyContent(String replyContent) {
			this.replyContent = replyContent;
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
			return "AdmReply [userId=" + userId + ", replyNo=" + replyNo + ", reportContent=" + reportContent
					+ ", recipeTitle=" + recipeTitle + ", replyContent=" + replyContent + ", enrollDate=" + enrollDate
					+ ", status=" + status + "]";
		}








		
     	
	
	

}
