package kr.or.ddit.reservation.vo;

import java.util.Date;

public class ResVO {
	String resNo;
	String memId;
	String accoNo;
	String accoName;
	String accoLoc;
	int accoPri;
	Date resStart;
	Date resEnd;
	String resPeople;
	int totalPrice;
	String revNo;
	int revCnt;
	int revCnt2;
	private String accoImgpath;
	private int accoImgNo;
	private String accoInfo;
	
	private String resStartStr;
	private String resEndStr;
	
	
	public String getResStartStr() {
		return resStartStr;
	}

	public void setResStartStr(String resStartStr) {
		this.resStartStr = resStartStr;
	}

	public String getResEndStr() {
		return resEndStr;
	}

	public void setResEndStr(String resEndStr) {
		this.resEndStr = resEndStr;
	}

	public String getAccoInfo() {
		return accoInfo;
	}

	public void setAccoInfo(String accoInfo) {
		this.accoInfo = accoInfo;
	}

	public String getAccoImgpath() {
		return accoImgpath;
	}

	public void setAccoImgpath(String accoImgpath) {
		this.accoImgpath = accoImgpath;
	}

	public int getAccoImgNo() {
		return accoImgNo;
	}

	public void setAccoImgNo(int accoImgNo) {
		this.accoImgNo = accoImgNo;
	}

	public ResVO() {}

//	public ResVO(String accoNo, Date resStart, Date resEnd, String resPeople) {
//		this.accoNo = accoNo;
//		this.resStart = resStart;
//		this.resEnd = resEnd;
//		this.resPeople = resPeople;
//	}
	
	public ResVO(String accoLoc, String resStartStr, String resEndStr, String resPeople) {
		this.accoLoc = accoLoc;
		this.resStartStr = resStartStr;
		this.resEndStr = resEndStr;
		this.resPeople = resPeople;
	}
	
	public ResVO(String resNo, String accoNo, Date resStart, Date resEnd, String resPeople) {
		this.resNo = resNo;
		this.accoNo = accoNo;
		this.resStart = resStart;
		this.resEnd = resEnd;
		this.resPeople = resPeople;
	}
	
	public ResVO(String resNo, String memId, String accoNo, Date resStart, Date resEnd, String resPeople) {
		this.resNo = resNo;
		this.memId = memId;
		this.accoNo = accoNo;
		this.resStart = resStart;
		this.resEnd = resEnd;
		this.resPeople = resPeople;
	}
	
	public ResVO(String resNo, String memId, String accoNo, String accoName, String accoLoc, int accoPri,
			Date resStart, Date resEnd, String resPeople, int totalPrice) {
		this.resNo = resNo;
		this.memId = memId;
		this.accoNo = accoNo;
		this.accoName = accoName;
		this.accoLoc = accoLoc;
		this.accoPri = accoPri;
		this.resStart = resStart;
		this.resEnd = resEnd;
		this.resPeople = resPeople;
		this.totalPrice = totalPrice;
	}

	
	public ResVO(Date resStart, Date resEnd, String resPeople) {
		this.resStart = resStart;
		this.resEnd = resEnd;
		this.resPeople = resPeople;
	}

	public int getRevCnt2() {
		return revCnt2;
	}

	public void setRevCnt2(int revCnt2) {
		this.revCnt2 = revCnt2;
	}

	public int getRevCnt() {
		return revCnt;
	}

	public void setRevCnt(int revCnt) {
		this.revCnt = revCnt;
	}

	public String getRevNo() {
		return revNo;
	}

	public void setRevNo(String revNo) {
		this.revNo = revNo;
	}

	public int getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}

	public String getResNo() {
		return resNo;
	}

	public void setResNo(String resNo) {
		this.resNo = resNo;
	}

	public String getMemId() {
		return memId;
	}

	public void setMemId(String memId) {
		this.memId = memId;
	}

	public String getAccoNo() {
		return accoNo;
	}

	public void setAccoNo(String accoNo) {
		this.accoNo = accoNo;
	}

	public String getAccoName() {
		return accoName;
	}

	public void setAccoName(String accoName) {
		this.accoName = accoName;
	}

	public String getAccoLoc() {
		return accoLoc;
	}

	public void setAccoLoc(String accoLoc) {
		this.accoLoc = accoLoc;
	}

	public int getAccoPri() {
		return accoPri;
	}

	public void setAccoPri(int accoPri) {
		this.accoPri = accoPri;
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

	public String getResPeople() {
		return resPeople;
	}

	public void setResPeople(String resPeople) {
		this.resPeople = resPeople;
	}

	@Override
	public String toString() {
		return "ResVO [resNo=" + resNo + ", memId=" + memId + ", accoNo=" + accoNo + ", accoName=" + accoName
				+ ", accoLoc=" + accoLoc + ", accoPri=" + accoPri + ", resStart=" + resStart + ", resEnd=" + resEnd
				+ ", resPeople=" + resPeople + ", totalPrice=" + totalPrice + ", revNo=" + revNo + ", revCnt=" + revCnt
				+ ", revCnt2=" + revCnt2 + ", accoImgpath=" + accoImgpath + ", accoImgNo=" + accoImgNo + ", accoInfo="
				+ accoInfo + "]";
	}

}
