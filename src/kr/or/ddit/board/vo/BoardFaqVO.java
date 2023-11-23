package kr.or.ddit.board.vo;

import java.sql.Date;

public class BoardFaqVO {
	private String faqNo;
	private String memId;
	private String faqTitle;
	private String faqContent;
	private Date faqDate;
	
	public BoardFaqVO() {

	}

	public BoardFaqVO(String faqNo, String memId, String faqTitle, String faqContent) {
		super();
		this.faqNo = faqNo;
		this.memId = memId;
		this.faqTitle = faqTitle;
		this.faqContent = faqContent;
	}

	public String getFaqNo() {
		return faqNo;
	}

	public void setFaqNo(String faqNo) {
		this.faqNo = faqNo;
	}

	public String getMemId() {
		return memId;
	}

	public void setMemId(String memId) {
		this.memId = memId;
	}

	public String getFaqTitle() {
		return faqTitle;
	}

	public void setFaqTitle(String faqTitle) {
		this.faqTitle = faqTitle;
	}

	public String getFaqContent() {
		return faqContent;
	}

	public void setFaqContent(String faqContent) {
		this.faqContent = faqContent;
	}

	public Date getFaqDate() {
		return faqDate;
	}

	public void setFaqDate(Date faqDate) {
		this.faqDate = faqDate;
	}

	@Override
	public String toString() {
		return "BoardFaqVO [faqNo=" + faqNo + ", memId=" + memId + ", faqTitle=" + faqTitle + ", faqContent="
				+ faqContent + ", faqDate=" + faqDate + "]";
	}

}
