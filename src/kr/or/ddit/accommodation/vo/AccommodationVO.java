package kr.or.ddit.accommodation.vo;

public class AccommodationVO {

	private String accoNo;
	private String accoName;
	private String accoLoc;
	private String accoMax;
	private int accoPri;
	private String accoInfo;
	private String accoCate;
	private String accoType;
	private String accoRoom;
	private String accoBed;
	private String accoBath;
	private String accoOpt;
	private String accoLoc2;
	private int accoImgNo;
	private String accoState;
	private String memId;
	private String accoImgpath;
	
	
	public String getAccoImgpath() {
		return accoImgpath;
	}


	public void setAccoImgpath(String accoImgpath) {
		this.accoImgpath = accoImgpath;
	}


	public AccommodationVO() {}


	public AccommodationVO(String accoNo, String accoName, String accoInfo, String accoImgpath) {

		this.accoNo = accoNo;
		this.accoName = accoName;
		this.accoInfo = accoInfo;
		this.accoImgpath = accoImgpath;

	}
	
	public AccommodationVO(String accoNo, String accoName, String accoLoc, String accoMax, int accoPri,
			String accoInfo, String accoCate, String accoType, String accoRoom, String accoBed, String accoBath,
			String accoOpt, String accoLoc2) {
		super();
		this.accoNo = accoNo;
		this.accoName = accoName;
		this.accoLoc = accoLoc;
		this.accoMax = accoMax;
		this.accoPri = accoPri;
		this.accoInfo = accoInfo;
		this.accoCate = accoCate;
		this.accoType = accoType;
		this.accoRoom = accoRoom;
		this.accoBed = accoBed;
		this.accoBath = accoBath;
		this.accoOpt = accoOpt;
		this.accoLoc2 = accoLoc2;
	}



	public AccommodationVO(String accoNo, String accoName, String accoLoc, String accoMax, int accoPri,
			String accoInfo, String accoCate, String accoType, String accoRoom, String accoBed, String accoBath,
			String accoOpt, String accoLoc2, String accoState) {
		super();
		this.accoNo = accoNo;
		this.accoName = accoName;
		this.accoLoc = accoLoc;
		this.accoMax = accoMax;
		this.accoPri = accoPri;
		this.accoInfo = accoInfo;
		this.accoCate = accoCate;
		this.accoType = accoType;
		this.accoRoom = accoRoom;
		this.accoBed = accoBed;
		this.accoBath = accoBath;
		this.accoOpt = accoOpt;
		this.accoLoc2 = accoLoc2;
		this.accoState = accoState;
	}


	public AccommodationVO(String accoState) {
	}

	
	
	public String getMemId() {
		return memId;
	}


	public void setMemId(String memId) {
		this.memId = memId;
	}


	public String getAccoState() {
		return accoState;
	}



	public void setAccoState(String accoState) {
		this.accoState = accoState;
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


	public String getAccoMax() {
		return accoMax;
	}


	public void setAccoMax(String accoMax) {
		this.accoMax = accoMax;
	}


	public int getAccoPri() {
		return accoPri;
	}


	public void setAccoPri(int accoPri) {
		this.accoPri = accoPri;
	}


	public String getAccoInfo() {
		return accoInfo;
	}


	public void setAccoInfo(String accoInfo) {
		this.accoInfo = accoInfo;
	}


	public String getAccoCate() {
		return accoCate;
	}


	public void setAccoCate(String accoCate) {
		this.accoCate = accoCate;
	}


	public String getAccoType() {
		return accoType;
	}


	public void setAccoType(String accoType) {
		this.accoType = accoType;
	}


	public String getAccoRoom() {
		return accoRoom;
	}


	public void setAccoRoom(String accoRoom) {
		this.accoRoom = accoRoom;
	}
	

	public String getAccoBed() {
		return accoBed;
	}


	public void setAccoBed(String accoBed) {
		this.accoBed = accoBed;
	}


	public String getAccoBath() {
		return accoBath;
	}


	public void setAccoBath(String accoBath) {
		this.accoBath = accoBath;
	}


	public String getAccoOpt() {
		return accoOpt;
	}


	public void setAccoOpt(String accoOpt) {
		this.accoOpt = accoOpt;
	}


	public String getAccoLoc2() {
		return accoLoc2;
	}


	public void setAccoLoc2(String accoLoc2) {
		this.accoLoc2 = accoLoc2;
	}


	public int getAccoImgNo() {
		return accoImgNo;
	}


	public void setAccoImgNo(int accoImgNo) {
		this.accoImgNo = accoImgNo;
	}


	@Override
	public String toString() {
		return "AccommodationVO [accoNo=" + accoNo + ", accoName=" + accoName + ", accoLoc=" + accoLoc + ", accoMax="
				+ accoMax + ", accoPri=" + accoPri + ", accoInfo=" + accoInfo + ", accoCate=" + accoCate + ", accoType="
				+ accoType + ", accoRoom=" + accoRoom + ", accoBed=" + accoBed + ", accoBath=" + accoBath + ", accoOpt="
				+ accoOpt + ", accoLoc2=" + accoLoc2 + ", accoImgNo=" + accoImgNo + "]";
	}

	
}
