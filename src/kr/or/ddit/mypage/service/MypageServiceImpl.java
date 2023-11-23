package kr.or.ddit.mypage.service;

import kr.or.ddit.member.vo.MemberVO;
import kr.or.ddit.mypage.dao.IMypageDao;
import kr.or.ddit.mypage.dao.MypageDaoImpl;

public class MypageServiceImpl implements IMypageService {

	private IMypageDao mypDao;
	
	private static IMypageService mypService;
	
	public MypageServiceImpl() {
	
		mypDao = MypageDaoImpl.getInstance();
	}
	
	public static IMypageService getInstance() {
		if(mypService == null) {
			mypService = new MypageServiceImpl();
		}
		return mypService;
	}
	
	@Override
	public MemberVO connUser(String memAth) {

		return mypDao.connAdmin(memAth);
	}

	@Override
	public MemberVO connHost(String memAth) {

		return mypDao.connHost(memAth);
	}

	@Override
	public MemberVO connAdmin(String memAth) {

		return mypDao.connAdmin(memAth);
	}

	
}
