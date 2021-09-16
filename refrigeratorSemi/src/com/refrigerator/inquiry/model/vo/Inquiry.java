package com.refrigerator.inquiry.model.vo;

// YunHeeRak 05-27

import java.sql.Date;

public class Inquiry {
	
	private int inqryNo; 
	private String inqryWriter;	// 작성자 회원ID 입력받기 때문에 String으로 정했습니다.
	private String inqryTitle;
	private String inqryContent;
	private Date enrollDate;
	private Date modifyDate;
	private Date answerDate;
	private String inqryAnswer;
	
	public Inquiry() {}
	
	public Inquiry(int inqryNo, String inqryWriter, String inqryTitle, String inqryContent, Date modifyDate) {
		super();
		this.inqryNo = inqryNo;
		this.inqryWriter = inqryWriter;
		this.inqryTitle = inqryTitle;
		this.inqryContent = inqryContent;
		this.modifyDate = modifyDate;
	}

	public Inquiry(int inqryNo, String inqryWriter, String inqryTitle, String inqryContent, Date modifyDate,
			Date answerDate, String inqryAnswer) {
		super();
		this.inqryNo = inqryNo;
		this.inqryWriter = inqryWriter;
		this.inqryTitle = inqryTitle;
		this.inqryContent = inqryContent;
		this.modifyDate = modifyDate;
		this.answerDate = answerDate;
		this.inqryAnswer = inqryAnswer;
	}

	public Inquiry(int inqryNo, String inqryWriter, String inqryTitle, String inqryContent, Date enrollDate,
			Date modifyDate, Date answerDate, String inqryAnswer) {
		super();
		this.inqryNo = inqryNo;
		this.inqryWriter = inqryWriter;
		this.inqryTitle = inqryTitle;
		this.inqryContent = inqryContent;
		this.enrollDate = enrollDate;
		this.modifyDate = modifyDate;
		this.answerDate = answerDate;
		this.inqryAnswer = inqryAnswer;
	}

	public Inquiry(int inqryNo, String inqryWriter, String inqryTitle, Date enrollDate, Date modifyDate) {
		super();
		this.inqryNo = inqryNo;
		this.inqryWriter = inqryWriter;
		this.inqryTitle = inqryTitle;
		this.enrollDate = enrollDate;
		this.modifyDate = modifyDate;
	}

	public Inquiry(String inqryWriter, String inqryTitle, String inqryContent, Date enrollDate, Date modifyDate,
			String inqryAnswer) {
		super();
		this.inqryWriter = inqryWriter;
		this.inqryTitle = inqryTitle;
		this.inqryContent = inqryContent;
		this.enrollDate = enrollDate;
		this.modifyDate = modifyDate;
		this.inqryAnswer = inqryAnswer;
	}

	public int getInqryNo() {
		return inqryNo;
	}

	public void setInqryNo(int inqryNo) {
		this.inqryNo = inqryNo;
	}

	public String getInqryWriter() {
		return inqryWriter;
	}

	public void setInqryWriter(String inqryWriter) {
		this.inqryWriter = inqryWriter;
	}

	public String getInqryTitle() {
		return inqryTitle;
	}

	public void setInqryTitle(String inqryTitle) {
		this.inqryTitle = inqryTitle;
	}

	public String getInqryContent() {
		return inqryContent;
	}

	public void setInqryContent(String inqryContent) {
		this.inqryContent = inqryContent;
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

	public Date getAnswerDate() {
		return answerDate;
	}

	public void setAnswerDate(Date answerDate) {
		this.answerDate = answerDate;
	}

	public String getInqryAnswer() {
		return inqryAnswer;
	}

	public void setInqryAnswer(String inqryAnswer) {
		this.inqryAnswer = inqryAnswer;
	}

	@Override
	public String toString() {
		return "Inquiry [inqryNo=" + inqryNo + ", inqryWriter=" + inqryWriter + ", inqryTitle=" + inqryTitle
				+ ", inqryContent=" + inqryContent + ", enrollDate=" + enrollDate + ", modifyDate=" + modifyDate
				+ ", answerDate=" + answerDate + ", inqryAnswer=" + inqryAnswer + "]";
	}
	
}
