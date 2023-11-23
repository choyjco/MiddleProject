package kr.or.ddit.member.service;

import java.util.List;

import kr.or.ddit.member.dao.IMemberDao;
import kr.or.ddit.member.dao.MemberDaoImpl;
import kr.or.ddit.member.vo.MemberVO;

public class MemberServiceImpl implements IMemberService {
	
	private IMemberDao memDao;
	
	private static IMemberService memService;
	
	private MemberServiceImpl() {
		
		memDao = MemberDaoImpl.getInstance();
	}

	public static IMemberService getInstance() {
		if(memService == null) {
			memService = new MemberServiceImpl();
		}
		return memService;
	}

	// 관리자 페이지 - 회원 수정
	@Override
	public int modifyMember(MemberVO mv) {
		
		return memDao.modifyMember(mv);
	}

	// 관리자 페이지 - 회원 삭제
	@Override
	public int deleteMember(String memId) {

		return memDao.deleteMember(memId);
	}

	
	@Override
	public List<MemberVO> inquiryMember(MemberVO mv) {

		return memDao.inquiryMember(mv);
	}

	// 관리자 페이지 - 회원 전체 조회 
	@Override
	public List<MemberVO> displayAllMember() {
		
		return memDao.displayAllMember();
	}

	@Override
	public boolean checkMember(String memId) {

		return memDao.checkMember(memId);
	}

	
	@Override
	public MemberVO getMember(String memId) {
		
		return memDao.getMember(memId);
	}

	// 관리자페이지 - 관리자 정보 수정
	@Override
	public int modifyAdmin(MemberVO mv) {

		return memDao.modifyAdmin(mv);
	}

	
	@Override
	public MemberVO getHost(String memId) {

		return memDao.getHost(memId);
	}

	// 관리자페이지 - 호스트 리스트 전체 조회
	@Override
	public List<MemberVO> displayAllHost() {

		return memDao.displayAllHost();
	}

	// 관리자페이지 - 호스트 정보 수정
	@Override
	public int modifyHost(MemberVO mv) {

		return memDao.modifyHost(mv);
	}

	// 마이페이지(회원, 호스트) 들어갔을 때 - 아이디 값 가져오기
	@Override
	public MemberVO getInfo(String memId) {
		
		return memDao.getInfo(memId);
	}


	@Override
	public MemberVO getMember2(String memId) {

		return memDao.getMember2(memId);
	}

	@Override
	public MemberVO getPass(String memPass) {
		
		return memDao.getPass(memPass);
	}
	
}
