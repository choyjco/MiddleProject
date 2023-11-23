package kr.or.ddit.restaurant.vo;

public class RestaurantVO {
	private String rstNo;
	private String rstName;
	private String rstMenu;
	private String rstLoc;
	private String rstTel;
	private String rstList;
	private String rstPrice;
	private String rstLat;
	private String rstLong;
	private String rstIntro;
	private String rstCate;
	private String rstTime;
	private String rstImgNo;
	private String rstImgPath;
	
	
	//RestaurantVO : RestaurantImgVO = 1 : 1
	private RestaurantImgVO restaurantImgVO;
	
	public RestaurantVO() {}
	
	public RestaurantVO(String rstNo, String rstLat, String rstLong, String rstName, String rstMenu, String rstLoc, String rstTel, String rstList, String rstPrice, String rstIntro, String rstCate, String rstTime) {
		super();
		
		this.rstNo = rstNo;
		this.rstName = rstName;
		this.rstMenu = rstMenu;
		this.rstTel = rstTel;
		this.rstLoc = rstLoc;
		this.rstList= rstList; 
		this.rstIntro = rstIntro;
		this.rstTime = rstTime;
		this.rstPrice = rstPrice;
		this.rstCate = rstCate;
		this.rstLat = rstLat;
		this.rstLong = rstLong;
	}
	
	public String getRstNo() {
		return rstNo;
	}
	public void setRstNo(String rstNo) {
		this.rstNo = rstNo;
	}
	public String getRstName() {
		return rstName;
	}
	public void setRstName(String rstName) {
		this.rstName = rstName;
	}
	public String getRstMenu() {
		return rstMenu;
	}
	public void setRstMenu(String rstMenu) {
		this.rstMenu = rstMenu;
	}
	public String getRstLoc() {
		return rstLoc;
	}
	public void setRstLoc(String rstLoc) {
		this.rstLoc = rstLoc;
	}
	public String getRstTel() {
		return rstTel;
	}
	public void setRstTel(String rstTel) {
		this.rstTel = rstTel;
	}
	public String getRstList() {
		return rstList;
	}
	public void setRstList(String rstList) {
		this.rstList = rstList;
	}
	public String getRstPrice() {
		return rstPrice;
	}
	public void setRstPrice(String rstPrice) {
		this.rstPrice = rstPrice;
	}
	public String getRstLat() {
		return rstLat;
	}
	public void setRstLat(String rstLat) {
		this.rstLat = rstLat;
	}
	public String getRstLong() {
		return rstLong;
	}
	public void setRstLong(String rstLong) {
		this.rstLong = rstLong;
	}
	public String getRstIntro() {
		return rstIntro;
	}
	public void setRstIntro(String rstIntro) {
		this.rstIntro = rstIntro;
	}
	public String getRstCate() {
		return rstCate;
	}
	public void setRstCate(String rstCate) {
		this.rstCate = rstCate;
	}
	public String getRstTime() {
		return rstTime;
	}
	public void setRstTime(String rstTime) {
		this.rstTime = rstTime;
	}
	
	
	
	public String getRstImgNo() {
		return rstImgNo;
	}

	public void setRstImgNo(String rstImgNo) {
		this.rstImgNo = rstImgNo;
	}

	public String getRstImgPath() {
		return rstImgPath;
	}

	public void setRstImgPath(String rstImgPath) {
		this.rstImgPath = rstImgPath;
	}

	public RestaurantImgVO getRestaurantImgVO() {
		return restaurantImgVO;
	}

	public void setRestaurantImgVO(RestaurantImgVO restaurantImgVO) {
		this.restaurantImgVO = restaurantImgVO;
	}

	@Override
	public String toString() {
		return "RestaurantVO [rstNo=" + rstNo + ", rstName=" + rstName + ", rstMenu=" + rstMenu + ", rstLoc=" + rstLoc
				+ ", rstTel=" + rstTel + ", rstList=" + rstList + ", rstPrice=" + rstPrice + ", rstLat=" + rstLat
				+ ", rstLong=" + rstLong + ", rstIntro=" + rstIntro + ", rstCate=" + rstCate + ", rstTime=" + rstTime
				+ ", rstImgNo=" + rstImgNo + ", rstImgPath=" + rstImgPath + ", restaurantImgVO=" + restaurantImgVO
				+ "]";
	}

	

	
}
	
	