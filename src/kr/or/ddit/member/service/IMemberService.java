package kr.or.ddit.member.service;

import java.util.List;

import kr.or.ddit.member.vo.MemberVO;

public interface IMemberService {

	public int modifyMember(MemberVO mv);
	
	public int deleteMember(String memId);
	
	public List<MemberVO> inquiryMember(MemberVO mv);
	
	public List<MemberVO> displayAllMember();
	
	public boolean checkMember(String memId);
	
	public MemberVO getMember(String memId); 
	
	public int modifyAdmin(MemberVO mv);
	
	public MemberVO getHost(String memId);
	
	public List<MemberVO> displayAllHost();
	
	public int modifyHost(MemberVO mv);
	
	public MemberVO getInfo(String memId);
	
	public MemberVO getMember2(String memId);
	
	public MemberVO getPass(String memPass);

	
}
