package com.refrigerator.faq.model.vo;

import java.sql.Date;

public class Faq {

	private int faqNo;
	private String quesContent;
	private String answerContent;
	private Date enrollDate;
	private Date modifyDate;
	private int count;
	private String status;

	public Faq() {}
	
	public Faq(int faqNo, String quesContent, String answerContent, Date modifyDate, int count) {
		super();
		this.faqNo = faqNo;
		this.quesContent = quesContent;
		this.answerContent = answerContent;
		this.modifyDate = modifyDate;
		this.count = count;
	}

	public Faq(int faqNo, String quesContent, String answerContent, Date enrollDate, Date modifyDate, int count,
			String status) {
		super();
		this.faqNo = faqNo;
		this.quesContent = quesContent;
		this.answerContent = answerContent;
		this.enrollDate = enrollDate;
		this.modifyDate = modifyDate;
		this.count = count;
		this.status = status;
	}

	public Faq(int faqNo, String quesContent, String answerContent, Date enrollDate, Date modifyDate, int count) {
		super();
		this.faqNo = faqNo;
		this.quesContent = quesContent;
		this.answerContent = answerContent;
		this.enrollDate = enrollDate;
		this.modifyDate = modifyDate;
		this.count = count;
	}

	public int getFaqNo() {
		return faqNo;
	}

	public void setFaqNo(int faqNo) {
		this.faqNo = faqNo;
	}

	public String getQuesContent() {
		return quesContent;
	}

	public void setQuesContent(String quesContent) {
		this.quesContent = quesContent;
	}

	public String getAnswerContent() {
		return answerContent;
	}

	public void setAnswerContent(String answerContent) {
		this.answerContent = answerContent;
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

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Faq [faqNo=" + faqNo + ", quesContent=" + quesContent + ", answerContent=" + answerContent
				+ ", enrollDate=" + enrollDate + ", modifyDate=" + modifyDate + ", count=" + count + ", status="
				+ status + "]";
	}
	
	
}
