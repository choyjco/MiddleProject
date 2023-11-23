package kr.or.ddit.board.vo;

import java.sql.Date;

public class BoardNotVO {
	private String notNo;
	private String memId;
	private String notTitle;
	private String notContent;
	private Date notDate;
	
	public BoardNotVO() {

	}

	public BoardNotVO(String notNo, String memId, String notTitle, String notContent) {
		super();
		this.notNo = notNo;
		this.memId = memId;
		this.notTitle = notTitle;
		this.notContent = notContent;
	}

	public String getNotNo() {
		return notNo;
	}

	public void setNotNo(String notNo) {
		this.notNo = notNo;
	}

	public String getMemId() {
		return memId;
	}

	public void setMemId(String memId) {
		this.memId = memId;
	}

	public String getNotTitle() {
		return notTitle;
	}

	public void setNotTitle(String notTitle) {
		this.notTitle = notTitle;
	}

	public String getNotContent() {
		return notContent;
	}

	public void setNotContent(String notContent) {
		this.notContent = notContent;
	}

	public Date getNotDate() {
		return notDate;
	}

	public void setNotDate(Date notDate) {
		this.notDate = notDate;
	}

	@Override
	public String toString() {
		return "BoardNotVO [notNo=" + notNo + ", memId=" + memId + ", notTitle=" + notTitle + ", notContent="
				+ notContent + ", notDate=" + notDate + "]";
	}

	
}
