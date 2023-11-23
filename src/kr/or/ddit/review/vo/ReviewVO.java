package kr.or.ddit.review.vo;

import java.util.Date;

public class ReviewVO {

	private String revNo;
	private String resNo;
	private String revCon;
	private int revStar;
	private Date revDate;
	private String accoNo;
	private String memId;
	
	private String accoName;
	private Date resStart;
	private Date resEnd;
	private int accoPri;
	
	
	public ReviewVO() {}

	
	public int getAccoPri() {
		return accoPri;
	}


	public void setAccoPri(int accoPri) {
		this.accoPri = accoPri;
	}


	public String getAccoName() {
		return accoName;
	}



	public void setAccoName(String accoName) {
		this.accoName = accoName;
	}



	public Date getResStart() {
		return resStart;
	}



	public void setResStart(Date resStart) {
		this.resStart = resStart;
	}



	public Date getResEnd() {
		return resEnd;
	}



	public void setResEnd(Date resEnd) {
		this.resEnd = resEnd;
	}



	public ReviewVO(String revNo, String resNo, String revCon, int revStar) {
		super();
		this.revNo = revNo;
		this.resNo = resNo;
		this.revCon = revCon;
		this.revStar = revStar;
	}


	public ReviewVO(String revNo, String resNo, String revCon, int revStar, String accoNo) {
		super();
		this.revNo = revNo;
		this.resNo = resNo;
		this.revCon = revCon;
		this.revStar = revStar;
		this.accoNo = accoNo;
	}


	public String getMemId() {
		return memId;
	}



	public void setMemId(String memId) {
		this.memId = memId;
	}



	public String getRevCon() {
		return revCon;
	}



	public void setRevCon(String revCon) {
		this.revCon = revCon;
	}



	public String getAccoNo() {
		return accoNo;
	}



	public void setAccoNo(String accoNo) {
		this.accoNo = accoNo;
	}



	public int getRevStar() {
		return revStar;
	}


	public void setRevStar(int revStar) {
		this.revStar = revStar;
	}


	public String getRevNo() {
		return revNo;
	}

	public void setRevNo(String revNo) {
		this.revNo = revNo;
	}

	public String getResNo() {
		return resNo;
	}

	public void setResNo(String resNo) {
		this.resNo = resNo;
	}


	public Date getRevDate() {
		return revDate;
	}

	public void setRevDate(Date revDate) {
		this.revDate = revDate;
	}

	@Override
	public String toString() {
		return "ReviewVO [revNo=" + revNo + ", resNo=" + resNo + ", resCon=" + revCon + ", revDate=" + revDate + "]";
	}
	
}
