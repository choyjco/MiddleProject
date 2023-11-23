package kr.or.ddit.mypage.dao;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.member.vo.MemberVO;
import kr.or.ddit.util.MyBatisUtil;

public class MypageDaoImpl implements IMypageDao {

	private static IMypageDao mypDao;
	
	public MypageDaoImpl() {

	}
	
	public static IMypageDao getInstance() {
		if(mypDao == null) {
			mypDao = new MypageDaoImpl();
		}
		return mypDao;
	}
	
	@Override
	public MemberVO connUser(String memAth) {
		
		SqlSession session = MyBatisUtil.getInstance(true);
		
		MemberVO mv = null;
		
		try {
			
			mv = session.selectOne("member.connUser", memAth);
			
			session.commit();
		
		}catch(PersistenceException ex) {
			session.rollback();
			ex.printStackTrace();
			
		}finally {
			session.close();
		}
		return mv;
	}

	@Override
	public MemberVO connHost(String memAth) {
		
		return null;
	}

	@Override
	public MemberVO connAdmin(String memAth) {
		
		return null;
	}

	
	
}
