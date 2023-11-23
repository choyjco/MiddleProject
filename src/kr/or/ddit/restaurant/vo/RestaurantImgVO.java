package kr.or.ddit.restaurant.vo;

public class RestaurantImgVO {
	private String rstImgNo;
	private String rstNo;
	private String rstImgPath;
	
	public RestaurantImgVO() {}

	public String getRstImgNo() {
		return rstImgNo;
	}

	public void setRstImgNo(String rstImgNo) {
		this.rstImgNo = rstImgNo;
	}

	public String getRstNo() {
		return rstNo;
	}

	public void setRstNo(String rstNo) {
		this.rstNo = rstNo;
	}

	public String getRstImgPath() {
		return rstImgPath;
	}

	public void setRstImgPath(String rstImgPath) {
		this.rstImgPath = rstImgPath;
	}

	@Override
	public String toString() {
		return "RestaurantImgVO [rstImgNo=" + rstImgNo + ", rstNo=" + rstNo + ", rstImgPath=" + rstImgPath + "]";
	}
	
	
	
}
