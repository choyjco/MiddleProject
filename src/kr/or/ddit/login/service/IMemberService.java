package kr.or.ddit.login.service;

import java.util.Map;

import kr.or.ddit.member.vo.MemberVO;

public interface IMemberService {
	
	//접근제한자 반환타입 메소드명(매개변수)
	
	//로그인 체크(id-pw검증)
	public String loginChk(Map<String, Object> map);


	public String passChk(Map<String, Object> map);

	public void updatePassword(String memMail, String memPw);

	
}
