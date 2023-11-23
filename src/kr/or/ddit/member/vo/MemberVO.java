package kr.or.ddit.member.vo;

public class MemberVO {

	 private String memId;
	 private String memPass;
	 private String memName;
	 private String memBir;
	 private String memMail;
	 private String memHp;
	 private String memAdd1;
	 private String memZip;
	 private String memAdd2;
	 private String regFile;
	 private String memAth; // 회원구분(host만 들어감, 관리자는 한명만!)
	 private String memCf; // 호스트 승인여부
	 
	
	 public MemberVO() {}


	public MemberVO(String memId, String memPass, String memName, String memBir, String memMail, String memHp,
			String memAdd1, String memZip, String memAdd2, String regFile, String memAth, String memCf) {

		this.memId = memId;
		this.memPass = memPass;
		this.memName = memName;
		this.memBir = memBir;
		this.memMail = memMail;
		this.memHp = memHp;
		this.memAdd1 = memAdd1;
		this.memZip = memZip;
		this.memAdd2 = memAdd2;
		this.regFile = regFile;
		this.memAth = memAth;
		this.memCf = memCf;		
		
	}


	// getMember()
	public MemberVO(String memId, String memPass, String memName, String memBir, String memMail, String memHp,
			String memAdd1, String memZip, String memAdd2) {

		this.memId = memId;
		this.memPass = memPass;
		this.memName = memName;
		this.memBir = memBir;
		this.memMail = memMail;
		this.memHp = memHp;
		this.memAdd1 = memAdd1;
		this.memZip = memZip;
		this.memAdd2 = memAdd2;
		
	}
	
	
	// getHost()
	public MemberVO(String memId, String memPass, String memName, String memBir, String memMail, String memHp,
			String memAdd1, String memZip, String memAdd2, String memAth, String memCf) {

		this.memId = memId;
		this.memPass = memPass;
		this.memName = memName;
		this.memBir = memBir;
		this.memMail = memMail;
		this.memHp = memHp;
		this.memAdd1 = memAdd1;
		this.memZip = memZip;
		this.memAdd2 = memAdd2;
		this.memAth = memAth;
		this.memCf = memCf;
		
	}


	// 수정
	public MemberVO(String memId, String memPass, String memHp, String memAdd1, String memZip, String memAdd2, String memCf) {

		this.memId = memId;
		this.memPass = memPass;
		this.memHp = memHp;
		this.memAdd1 = memAdd1;
		this.memZip = memZip;
		this.memAdd2 = memAdd2;
		this.memCf = memCf;
		
	}

	
	// 관리자 정보 변경, modifyAdmin()
	public MemberVO(String memId, String memPass, String memName, String memMail) {

		this.memId = memId;
		this.memPass = memPass;
		this.memName = memName;
		this.memMail = memMail;
		
	}


	public MemberVO(String memId2, String memPass2, String memName2, String memBir2, String memMail2, String memHp2,
			String memAdd12, String memZip2, String memAdd22, String memCf2) {
		// TODO Auto-generated constructor stub
	}


	public String getMemId() {
		return memId;
	}


	public void setMemId(String memId) {
		this.memId = memId;
	}


	public String getMemPass() {
		return memPass;
	}


	public void setMemPass(String memPass) {
		this.memPass = memPass;
	}


	public String getMemName() {
		return memName;
	}


	public void setMemName(String memName) {
		this.memName = memName;
	}


	public String getMemBir() {
		return memBir;
	}


	public void setMemBir(String memBir) {
		this.memBir = memBir;
	}


	public String getMemMail() {
		return memMail;
	}


	public void setMemMail(String memMail) {
		this.memMail = memMail;
	}


	public String getMemHp() {
		return memHp;
	}


	public void setMemHp(String memHp) {
		this.memHp = memHp;
	}


	public String getMemAdd1() {
		return memAdd1;
	}


	public void setMemAdd1(String memAdd1) {
		this.memAdd1 = memAdd1;
	}


	public String getMemZip() {
		return memZip;
	}


	public void setMemZip(String memZip) {
		this.memZip = memZip;
	}


	public String getMemAdd2() {
		return memAdd2;
	}


	public void setMemAdd2(String memAdd2) {
		this.memAdd2 = memAdd2;
	}


	public String getRegFile() {
		return regFile;
	}


	public void setRegFile(String regFile) {
		this.regFile = regFile;
	}


	public String getMemAth() {
		return memAth;
	}


	public void setMemAth(String memAth) {
		this.memAth = memAth;
	}


	public String getMemCf() {
		return memCf;
	}


	public void setMemCf(String memCf) {
		this.memCf = memCf;
	}


	@Override
	public String toString() {
		return "MemberVO [memId=" + memId + ", memPass=" + memPass + ", memName=" + memName + ", memBir=" + memBir
				+ ", memMail=" + memMail + ", memHp=" + memHp + ", memAdd1=" + memAdd1 + ", memZip=" + memZip
				+ ", memAdd2=" + memAdd2 + ", regFile=" + regFile + ", memAth=" + memAth + ", memCf=" + memCf + "]";
	}


	 
}	