package kr.or.ddit.board.dao;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.board.vo.BoardAskVO;
import kr.or.ddit.util.MyBatisUtil;

public class BoardAskDaoImpl implements IBoardAskDao {

	private static IBoardAskDao boardAskDao;
	
	public BoardAskDaoImpl() {

	}
	
	public static IBoardAskDao getInstance() {
		if(boardAskDao == null) {
			boardAskDao = new BoardAskDaoImpl();
		}
		
		return boardAskDao;
	}
	
	@Override
	public int insertBoardAsk(BoardAskVO bav) {
		
		int cnt = 0;

		SqlSession session = MyBatisUtil.getInstance();
		
		try {
			cnt = session.insert("boardAsk.insertBoardAsk", bav);
			
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
	public boolean checkBoardAsk(String askNo) {
		
		boolean isExist = false;
		
		SqlSession session = MyBatisUtil.getInstance(true);

		try {
			int cnt = session.selectOne("boardAsk.checkBoardAsk", askNo);

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
	public List<BoardAskVO> getAllBoardAsk() {
		
		List<BoardAskVO> boardAskList = new ArrayList<BoardAskVO>();
		
		SqlSession session = MyBatisUtil.getInstance();

		try {
		
			boardAskList = session.selectList("boardAsk.getAllBoardAsk");

		} catch (PersistenceException ex) {
			ex.printStackTrace();
		} finally {
			session.close();
		}
		return boardAskList;
	}
	
	//상세 보기
	@Override
	public BoardAskVO getBoardAsk(String askNo) {
		
		BoardAskVO boardAsk = new BoardAskVO();
		
		SqlSession session = MyBatisUtil.getInstance();
		
		try {
			
			boardAsk = session.selectOne("boardAsk.getBoardAsk",askNo);
			
		} catch (PersistenceException ex) {
			ex.printStackTrace();
		} finally {
			session.close();
		}
		return boardAsk;
	}

	@Override
	public int updateBoardAsk(BoardAskVO bav) {

		int cnt = 0;
		
		SqlSession session = MyBatisUtil.getInstance();

		try {
			cnt = session.update("boardAsk.updateBoardAsk", bav);
			
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
	public int deleteBoardAsk(String askNo) {
		
		int cnt = 0;
		
		SqlSession session = MyBatisUtil.getInstance();

		try {
			cnt = session.delete("boardAsk.deleteBoardAsk", askNo);
			
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
	public List<BoardAskVO> searchBoardAsk(BoardAskVO bav) {
		
		List<BoardAskVO> boardAskList = Collections.EMPTY_LIST;
		
		SqlSession session = null;

		try {
			session = MyBatisUtil.getInstance(true);
			
			Map<String, String> paraMap = new HashMap<String, String>();
			
			paraMap.put("askNo", bav.getAskNo());
			paraMap.put("memId", bav.getMemId());
			paraMap.put("askTitle", bav.getAskTitle());
			paraMap.put("askContent", bav.getAskContent());

			boardAskList = session.selectList("boardAsk.searchBoardAsk", bav);

		} catch (PersistenceException ex) {
			ex.printStackTrace();
		} finally {
			session.close();
		}
		return boardAskList;
	}

}
