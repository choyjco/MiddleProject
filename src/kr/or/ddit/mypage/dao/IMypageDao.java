package kr.or.ddit.mypage.dao;

import kr.or.ddit.member.vo.MemberVO;

public interface IMypageDao {

	public MemberVO connUser(String memAth);

	public MemberVO connHost(String memAth);
	
	public MemberVO connAdmin(String memAth);
	
	
}
