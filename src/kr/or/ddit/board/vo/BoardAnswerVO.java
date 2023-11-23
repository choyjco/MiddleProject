package kr.or.ddit.board.vo;

import java.sql.Date;

public class BoardAnswerVO {
	private String askNo;
	private String memId;
	private String ansContent;
	private Date ansDate;
	
	public BoardAnswerVO() {

	}

	public BoardAnswerVO(String askNo, String memId, String ansContent) {
		super();
		this.askNo = askNo;
		this.memId = memId;
		this.ansContent = ansContent;
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

	public String getAnsContent() {
		return ansContent;
	}

	public void setAnsContent(String ansContent) {
		this.ansContent = ansContent;
	}

	public Date getAnsDate() {
		return ansDate;
	}

	public void setAnsDate(Date ansDate) {
		this.ansDate = ansDate;
	}

	@Override
	public String toString() {
		return "BoardAnswerVO [askNo=" + askNo + ", memId=" + memId + ", ansContent=" + ansContent + ", ansDate="
				+ ansDate + "]";
	}



}
