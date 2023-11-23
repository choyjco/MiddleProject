package kr.or.ddit.blacklist.vo;

import java.sql.Date;

public class BlacklistVO {
	
	private String blkNo;
	private String memId;
	private String blkContent;
	private Date blkDate;
	private String blkDays;
	private String blkYn;
	
	public BlacklistVO() {

	}

	public BlacklistVO(String blkNo, String memId, String blkContent) {
		super();
		this.blkNo = blkNo;
		this.memId = memId;
		this.blkContent = blkContent;
	}

	public String getBlkNo() {
		return blkNo;
	}

	public void setBlkNo(String blkNo) {
		this.blkNo = blkNo;
	}

	public String getMemId() {
		return memId;
	}

	public void setMemId(String memId) {
		this.memId = memId;
	}

	public String getBlkContent() {
		return blkContent;
	}

	public void setBlkContent(String blkContent) {
		this.blkContent = blkContent;
	}

	public Date getBlkDate() {
		return blkDate;
	}

	public void setBlkDate(Date blkDate) {
		this.blkDate = blkDate;
	}

	public String getBlkDays() {
		return blkDays;
	}

	public void setBlkDays(String blkDays) {
		this.blkDays = blkDays;
	}

	public String getBlkYn() {
		return blkYn;
	}

	public void setBlkYn(String blkYn) {
		this.blkYn = blkYn;
	}

	@Override
	public String toString() {
		return "BlacklistVO [blkNo=" + blkNo + ", memId=" + memId + ", blkContent=" + blkContent
				+ ", blkDate=" + blkDate + ", blkDays=" + blkDays + ", blkYn=" + blkYn + "]";
	}

	
}
