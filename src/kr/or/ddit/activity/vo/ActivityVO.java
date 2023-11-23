package kr.or.ddit.activity.vo;

import kr.or.ddit.activity.vo.ActivityImgVO;

public class ActivityVO {
	private String actNo;
	private String actName;
	private String actLoc;
	private String actTel;
	private String actIntro;
	private String actList;
	private String actCate;
	private String actLat;
	private String actLong;
	
	private ActivityImgVO activityImgVO;
	
	public ActivityVO() {}
	
	public ActivityVO(String actNo, String actCate, String actName, String actList, String actTel, String actLat, String actLong, String actLoc, String actIntro) {
		super();
		this.actNo = actNo;
		this.actName = actName;
		this.actList = actList;
		this.actCate = actCate;
		this.actTel = actTel;
		this.actLat = actLat;
		this.actLong = actLong;
		this.actLoc = actLoc;
		this.actIntro = actIntro;	
	}
	
	public ActivityVO(String actName) {
	    this.actName = actName;
	}

	public String getActNo() {
		return actNo;
	}

	public void setActNo(String actNo) {
		this.actNo = actNo;
	}

	public String getActName() {
		return actName;
	}

	public void setActName(String actName) {
		this.actName = actName;
	}

	public String getActLoc() {
		return actLoc;
	}

	public void setActLoc(String actLoc) {
		this.actLoc = actLoc;
	}

	public String getActTel() {
		return actTel;
	}

	public void setActTel(String actTel) {
		this.actTel = actTel;
	}

	public String getActCate() {
		return actCate;
	}

	public void setActCate(String actCate) {
		this.actCate = actCate;
	}

	public String getActLat() {
		return actLat;
	}

	public void setActLat(String actLat) {
		this.actLat = actLat;
	}

	public String getActIntro() {
		return actIntro;
	}

	public void setActIntro(String actIntro) {
		this.actIntro = actIntro;
	}

	public String getActLong() {
		return actLong;
	}

	public void setActLong(String actLong) {
		this.actLong = actLong;
	}
	
	public String getActList() {
		return actList;
	}

	public void setActList(String actList) {
		this.actList = actList;
	}

	public ActivityImgVO getActivityImgVO() {
		return activityImgVO;
	}
	
	public void setActivityImgVO(ActivityImgVO activityImgVO) {
		this.activityImgVO = activityImgVO;
	}

	@Override
	public String toString() {
		return "ActivityVO [actNo=" + actNo + ", actName=" + actName + ", actLoc=" + actLoc + ", actTel=" + actTel
				+ ", actCate=" + actCate + ", actLat=" + actLat + ", actIntro=" + actIntro + ", actLong=" + actLong
				+ ", activityImgVO=" + activityImgVO + "]";
	}

	
	
	
}
