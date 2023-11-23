package kr.or.ddit.blacklist.dao;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.blacklist.vo.BlacklistVO;
import kr.or.ddit.util.MyBatisUtil;

public class BlacklistDaoImpl implements IBlacklistDao {

	private static IBlacklistDao blacklistDao;
	
	public BlacklistDaoImpl() {

	}
	
	public static IBlacklistDao getInstance() {
		if(blacklistDao == null) {
			blacklistDao = new BlacklistDaoImpl();
		}
		
		return blacklistDao;
	}
	
	@Override
	public int insertBlacklist(BlacklistVO bv) {
		
		int cnt = 0;

		SqlSession session = MyBatisUtil.getInstance();
		
		try {
			cnt = session.insert("blacklist.insertBlacklist", bv);
			
			session.commit();

		} catch (PersistenceException ex) {
			session.rollback();
			ex.printStackTrace();
		} finally {
			session.close();
		}

		return cnt;
	}

	@Override
	public boolean checkBlacklist(String blkNo) {
		
		boolean isExist = false;
		
		SqlSession session = MyBatisUtil.getInstance(true);

		try {
			int cnt = session.selectOne("blacklist.checkBlacklist", blkNo);

			if (cnt > 0) {
				isExist = true;
			}

			session.commit();
			
		} catch (PersistenceException ex) {
			session.rollback();
			ex.printStackTrace();
		} finally {
			session.close();
		}

		return isExist;
	}

	@Override
	public List<BlacklistVO> getAllBlacklist() {
		
		List<BlacklistVO> blacklistList = new ArrayList<BlacklistVO>();
		
		SqlSession session = MyBatisUtil.getInstance();

		try {
		
			blacklistList = session.selectList("blacklist.getAllBlacklist");

		} catch (PersistenceException ex) {
			ex.printStackTrace();
		} finally {
			session.close();
		}
		return blacklistList;
	}
	
	//상세 보기
	@Override
	public BlacklistVO getBlacklist(String blkNo) {
		
		BlacklistVO blacklist = new BlacklistVO();
		
		SqlSession session = MyBatisUtil.getInstance();
		
		try {
			
			blacklist = session.selectOne("blacklist.getBlacklist",blkNo);
			
		} catch (PersistenceException ex) {
			ex.printStackTrace();
		} finally {
			session.close();
		}
		return blacklist;
	}

	@Override
	public int updateBlacklist(BlacklistVO bv) {

		int cnt = 0;
		
		SqlSession session = MyBatisUtil.getInstance();

		try {
			cnt = session.update("blacklist.updateBlacklist", bv);
			
			session.commit();

		} catch (PersistenceException ex) {
			session.rollback();
			ex.printStackTrace();
		} finally {
			session.close();
		}

		return cnt;
	}

	@Override
	public int deleteBlacklist(String blkNo) {
		
		int cnt = 0;
		
		SqlSession session = MyBatisUtil.getInstance();

		try {
			cnt = session.delete("blacklist.deleteBlacklist", blkNo);
			
			session.commit();

		} catch (PersistenceException ex) {
			session.rollback();
			ex.printStackTrace();
		} finally {
			session.close();
		}

		return cnt;
	}

	@Override
	public List<BlacklistVO> searchBlacklist(BlacklistVO bv) {
		
		List<BlacklistVO> blacklistList = Collections.EMPTY_LIST;
		
		SqlSession session = null;

		try {
			session = MyBatisUtil.getInstance(true);
			
			Map<String, String> paraMap = new HashMap<String, String>();
			
			paraMap.put("blkNo", bv.getBlkNo());
			paraMap.put("memId", bv.getMemId());
			paraMap.put("blkContent", bv.getBlkContent());

			blacklistList = session.selectList("blacklist.searchBlacklist", bv);

		} catch (PersistenceException ex) {
			ex.printStackTrace();
		} finally {
			session.close();
		}
		return blacklistList;
	}
	

	
	

}
