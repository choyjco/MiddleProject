package kr.or.ddit.mypage.service;

import kr.or.ddit.member.vo.MemberVO;

public interface IMypageService {

	public MemberVO connUser(String memAth);

	public MemberVO connHost(String memAth);
	
	public MemberVO connAdmin(String memAth);
	
}
