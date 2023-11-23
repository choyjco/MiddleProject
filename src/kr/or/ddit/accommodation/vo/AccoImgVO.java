package kr.or.ddit.accommodation.vo;

public class AccoImgVO {
	
	private int AccoImgNo;
	private String AccoImgPath;
	private int AccoImgSn =1;
	
	public AccoImgVO() {}

	public AccoImgVO(int accoImgNo, String accoImgPath, int accoImgSn) {
		super();
		AccoImgNo = accoImgNo;
		AccoImgPath = accoImgPath;
		AccoImgSn = accoImgSn;
	}
	
    public AccoImgVO(int accoImgNo) {
        this.AccoImgNo = accoImgNo;
    }

	public int getAccoImgNo() {
		return AccoImgNo;
	}

	public void setAccoImgNo(int accoImgNo) {
		AccoImgNo = accoImgNo;
	}

	public String getAccoImgPath() {
		return AccoImgPath;
	}

	public void setAccoImgPath(String accoImgPath) {
		AccoImgPath = accoImgPath;
	}

	public int getAccoImgSn() {
		return AccoImgSn;
	}

	public void setAccoImgSn(int accoImgSn) {
		AccoImgSn = accoImgSn;
	}

	@Override
	public String toString() {
		return "AccoImgVO [AccoImgNo=" + AccoImgNo + ", AccoImgPath=" + AccoImgPath + ", AccoImgSn=" + AccoImgSn + "]";
	}
	
	
}
