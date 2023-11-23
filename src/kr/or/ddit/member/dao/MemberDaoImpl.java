package kr.or.ddit.member.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.member.vo.MemberVO;
import kr.or.ddit.util.MyBatisUtil;

public class MemberDaoImpl implements IMemberDao {
	
	private static IMemberDao memDao;
	
	public MemberDaoImpl() {

	}
	
	public static IMemberDao getInstance() {
		if(memDao == null) {
			memDao = new MemberDaoImpl();
		}
		return memDao;
	}

	@Override
	public int modifyMember(MemberVO mv) {
		int cnt = 0;
		
		SqlSession session = MyBatisUtil.getInstance();
		
		try {
			
			cnt = session.update("member.modifyMember", mv);
			
			session.commit();
			
		}catch(PersistenceException ex) {
			session.rollback();
			ex.printStackTrace();
			
		}finally {
			session.close();
		}
			
		return cnt;
	}

	@Override
	public int deleteMember(String memId) {
		int cnt = 0;
		
		SqlSession session = MyBatisUtil.getInstance();
		
		try {
			
			cnt = session.delete("member.deleteMember", memId);
			
			session.commit();
			
		}catch(PersistenceException ex) {
			session.rollback();
			ex.printStackTrace();
			
		}finally {
			session.close();
		}
			
		return cnt;
	}

//	@Override
//	public List<MemberVO> inquiryMember(MemberVO mv) {
//		
//		List<MemberVO> memList = Collections.EMPTY_LIST;
//		
//		SqlSession session = null;
//		
//		try {
//			session = MyBatisUtil.getInstance(true);
//			
//			Map<String, String> paraMap = new HashMap<String, String>();
//			paraMap.put("memId", mv.getMemId());
//			paraMap.put("memPass", mv.getmemPass());
//			paraMap.put("memName", mv.getMemName());
//			paraMap.put("memBir", mv.getMemBir());
//			paraMap.put("memMail", mv.getMemMail());
//			paraMap.put("memHp", mv.getMemHp());
//			paraMap.put("memAdd1", mv.getMemAdd1());
//			paraMap.put("memZip", mv.getMemZip());
//			paraMap.put("memAdd2", mv.getMemAdd2());
//			
//			memList = session.selectList("member.inquiryMember", paraMap);
//		
//		}catch (PersistenceException ex) {
//			ex.printStackTrace();
//		}finally {
//			session.close();
//		}
//		return memList;
//	}

	@Override
	public List<MemberVO> displayAllMember() {
		
		List<MemberVO> memList = new ArrayList<MemberVO>();
		
		SqlSession session = MyBatisUtil.getInstance();
		
		try {
			
			memList = session.selectList("member.displayAllMember");
			
		}catch(PersistenceException ex) {
			ex.printStackTrace();
		}finally {
			session.close();
		}
		
		return memList;
	}

	@Override
	public boolean checkMember(String memId) {
		boolean isExist = false;
		
		SqlSession session = MyBatisUtil.getInstance(true);
		
		try {
			
			int cnt = session.selectOne("member.checkMember", memId);
			
			if(cnt > 0) {
				isExist = true;
			}
			
			session.commit();
			
		}catch(PersistenceException ex) {
			session.rollback();
			ex.printStackTrace();
			
		}finally {
			session.close();
		}
			
		return isExist;
	}

	@Override
	public MemberVO getMember(String memId) {
		SqlSession session = MyBatisUtil.getInstance(true);
		
		MemberVO mv = null;
		
		try {
			
			mv = session.selectOne("member.getMember", memId);
			
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
	public int modifyAdmin(MemberVO mv) {

		int cnt = 0;
		
		SqlSession session = MyBatisUtil.getInstance();
		
		try {
			
			cnt = session.update("member.modifyAdmin", mv);
			
			session.commit();
			
		}catch(PersistenceException ex) {
			session.rollback();
			ex.printStackTrace();
			
		}finally {
			session.close();
		}
			
		return cnt;
	}

	@Override
	public MemberVO getHost(String memId) {

		SqlSession session = MyBatisUtil.getInstance(true);
		
		MemberVO mv = null;
		
		try {
			
			mv = session.selectOne("member.getHost", memId);
			
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
	public List<MemberVO> displayAllHost() {

		List<MemberVO> memList = new ArrayList<MemberVO>();
		
		SqlSession session = MyBatisUtil.getInstance();
		
		try {
			
			memList = session.selectList("member.displayAllHost");
			
		}catch(PersistenceException ex) {
			ex.printStackTrace();
		}finally {
			session.close();
		}
		
		return memList;
	}

	@Override
	public int modifyHost(MemberVO mv) {

		int cnt = 0;
		
		SqlSession session = MyBatisUtil.getInstance();
		
		try {
			
			cnt = session.update("member.modifyHost", mv);
			
			session.commit();
			
		}catch(PersistenceException ex) {
			session.rollback();
			ex.printStackTrace();
			
		}finally {
			session.close();
		}
			
		return cnt;
	}

	@Override
	public MemberVO getInfo(String memId) {
		
		SqlSession session = MyBatisUtil.getInstance(true);
		
		MemberVO mv = null;
		
		try {
			
			mv = session.selectOne("member.getInfo", memId);
			
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
	public MemberVO getMember2(String memId) {
		SqlSession session = MyBatisUtil.getInstance(true);
		
		MemberVO mv = null;
		
		try {
			
			mv = session.selectOne("member.getMember2", memId);
			
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
	public MemberVO getPass(String memPass) {

		SqlSession session = MyBatisUtil.getInstance(true);
		
		MemberVO mv = null;
		
		try {
			
			mv = session.selectOne("member.getPass", memPass);
			
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
	public List<MemberVO> inquiryMember(MemberVO mv) {
		// TODO Auto-generated method stub
		return null;
	}
}