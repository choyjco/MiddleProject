package kr.or.ddit.accommodationwish.vo;

public class AccoWishVO {
	String accoWishNo;
	String memId;
	String accoNo;
	String accoName;
	String accoInfo;
	int accoPri;
	
	public AccoWishVO() {}
	
	public AccoWishVO(String accoWishNo, String memId, String accoNo) {
		this.accoWishNo = accoWishNo;
		this.memId = memId;
		this.accoNo = accoNo;
	}
	
	public AccoWishVO(String accoWishNo, String memId, String accoNo, String accoName, String accoInfo, int accoPri) {
		this.accoWishNo = accoWishNo;
		this.memId = memId;
		this.accoNo = accoNo;
		this.accoName = accoName;
		this.accoInfo = accoInfo;
		this.accoPri = accoPri;
	}

	public String getAccoName() {
		return accoName;
	}

	public void setAccoName(String accoName) {
		this.accoName = accoName;
	}

	public String getAccoInfo() {
		return accoInfo;
	}

	public void setAccoInfo(String accoInfo) {
		this.accoInfo = accoInfo;
	}

	public int getAccoPri() {
		return accoPri;
	}

	public void setAccoPri(int accoPri) {
		this.accoPri = accoPri;
	}

	public AccoWishVO(String accoNo) {
		this.accoNo = accoNo;
	}

	public String getAccoWishNo() {
		return accoWishNo;
	}

	public void setAccoWishNo(String accoWishNo) {
		this.accoWishNo = accoWishNo;
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

	@Override
	public String toString() {
		return "AccoWishVO [accoWishNo=" + accoWishNo + ", memId=" + memId + ", accoNo=" + accoNo + ", accoName="
				+ accoName + ", accoInfo=" + accoInfo + ", accoPri=" + accoPri + "]";
	}
	
}
