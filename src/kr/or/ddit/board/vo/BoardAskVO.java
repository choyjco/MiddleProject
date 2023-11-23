package kr.or.ddit.board.vo;

import java.sql.Date;

public class BoardAskVO {
	private String askNo;
	private String memId;
	private String askTitle;
	private String askContent;
	private Date askDate;
	private String askAns;
	
	public BoardAskVO() {

	}

	public BoardAskVO(String askNo, String memId, String askTitle, String askContent) {
		super();
		this.askNo = askNo;
		this.memId = memId;
		this.askTitle = askTitle;
		this.askContent = askContent;
	}

	public String getAskNo() {
		return askNo;
	}

	public void setAskNo(String askNo) {
		this.askNo = askNo;
	}

	public String getMemId() {
		return memId;
	}

	public void setMemId(String memId) {
		this.memId = memId;
	}

	public String getAskTitle() {
		return askTitle;
	}

	public void setAskTitle(String askTitle) {
		this.askTitle = askTitle;
	}

	public String getAskContent() {
		return askContent;
	}

	public void setAskContent(String askContent) {
		this.askContent = askContent;
	}

	public Date getAskDate() {
		return askDate;
	}

	public void setAskDate(Date askDate) {
		this.askDate = askDate;
	}

	public String getAskAns() {
		return askAns;
	}

	public void setAskAns(String askAns) {
		this.askAns = askAns;
	}

	@Override
	public String toString() {
		return "BoardAskVO [askNo=" + askNo + ", memId=" + memId + ", askTitle=" + askTitle + ", askContent="
				+ askContent + ", askDate=" + askDate + ", askAns=" + askAns + "]";
	}


}
