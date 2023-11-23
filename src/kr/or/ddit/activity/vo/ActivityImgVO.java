package kr.or.ddit.activity.vo;

public class ActivityImgVO {
	private String actImgNo;
	private String actNo;
	private String actImgPath;
	
	public ActivityImgVO() {}
	
	public String getActImgNo() {
		return actImgNo;
	}
	public void setActImgNo(String actImgNo) {
		this.actImgNo = actImgNo;
	}
	public String getActNo() {
		return actNo;
	}
	public void setActNo(String actNo) {
		this.actNo = actNo;
	}
	public String getActImgPath() {
		return actImgPath;
	}
	public void setActImgPath(String actImgPath) {
		this.actImgPath = actImgPath;
	}
	@Override
	public String toString() {
		return "ActivityImgVO [actImgNo=" + actImgNo + ", actNo=" + actNo + ", actImgPath=" + actImgPath + "]";
	}

	

	
}
