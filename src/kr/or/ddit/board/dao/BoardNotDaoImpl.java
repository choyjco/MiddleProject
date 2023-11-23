package kr.or.ddit.board.dao;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.board.vo.BoardNotVO;
import kr.or.ddit.util.MyBatisUtil;

public class BoardNotDaoImpl implements IBoardNotDao {

	private static IBoardNotDao boardNotDao;
	
	public BoardNotDaoImpl() {

	}
	
	public static IBoardNotDao getInstance() {
		if(boardNotDao == null) {
			boardNotDao = new BoardNotDaoImpl();
		}
		
		return boardNotDao;
	}
	
	@Override
	public int insertBoardNot(BoardNotVO bnv) {
		
		int cnt = 0;

		SqlSession session = MyBatisUtil.getInstance();
		
		try {
			cnt = session.insert("boardNot.insertBoardNot", bnv);
			
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
	public boolean checkBoardNot(String notNo) {
		
		boolean isExist = false;
		
		SqlSession session = MyBatisUtil.getInstance(true);

		try {
			int cnt = session.selectOne("boardNot.checkBoardNot", notNo);

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
	public List<BoardNotVO> getAllBoardNot() {
		
		List<BoardNotVO> boardNotList = new ArrayList<BoardNotVO>();
		
		SqlSession session = MyBatisUtil.getInstance();

		try {
		
			boardNotList = session.selectList("boardNot.getAllBoardNot");

		} catch (PersistenceException ex) {
			ex.printStackTrace();
		} finally {
			session.close();
		}
		return boardNotList;
	}
	
	//상세 보기
	@Override
	public BoardNotVO getBoardNot(String notNo) {
		
		BoardNotVO boardNot = new BoardNotVO();
		
		SqlSession session = MyBatisUtil.getInstance();
		
		try {
			
			boardNot = session.selectOne("boardNot.getBoardNot",notNo);
			
		} catch (PersistenceException ex) {
			ex.printStackTrace();
		} finally {
			session.close();
		}
		return boardNot;
	}

	@Override
	public int updateBoardNot(BoardNotVO bnv) {

		int cnt = 0;
		
		SqlSession session = MyBatisUtil.getInstance();

		try {
			cnt = session.update("boardNot.updateBoardNot", bnv);
			
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
	public int deleteBoardNot(String notNo) {
		
		int cnt = 0;
		
		SqlSession session = MyBatisUtil.getInstance();

		try {
			cnt = session.delete("boardNot.deleteBoardNot", notNo);
			
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
	public List<BoardNotVO> searchBoardNot(BoardNotVO bnv) {
		
		List<BoardNotVO> boardNotList = Collections.EMPTY_LIST;
		
		SqlSession session = null;

		try {
			session = MyBatisUtil.getInstance(true);
			
			Map<String, String> paraMap = new HashMap<String, String>();
			
			paraMap.put("notNo", bnv.getNotNo());
			paraMap.put("memId", bnv.getMemId());
			paraMap.put("notTitle", bnv.getNotTitle());
			paraMap.put("notContent", bnv.getNotContent());

			boardNotList = session.selectList("boardNot.searchBoardNot", bnv);

		} catch (PersistenceException ex) {
			ex.printStackTrace();
		} finally {
			session.close();
		}
		return boardNotList;
	}
	

	
	

}
