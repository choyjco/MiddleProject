package kr.or.ddit.board.dao;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.board.vo.BoardAnswerVO;
import kr.or.ddit.util.MyBatisUtil;

public class BoardAnswerDaoImpl implements IBoardAnswerDao {

	private static IBoardAnswerDao boardAnswerDao;
	
	public BoardAnswerDaoImpl() {

	}
	
	public static IBoardAnswerDao getInstance() {
		if(boardAnswerDao == null) {
			boardAnswerDao = new BoardAnswerDaoImpl();
		}
		
		return boardAnswerDao;
	}

	@Override
	public int insertBoardAnswer(BoardAnswerVO basv) {
		
		int cnt = 0;

		SqlSession session = MyBatisUtil.getInstance();
		
		try {
			cnt = session.insert("boardAnswer.insertBoardAnswer", basv);
			
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
	public List<BoardAnswerVO> getAllBoardAnswer() {
		
		List<BoardAnswerVO> boardAnswerList = new ArrayList<BoardAnswerVO>();
		
		SqlSession session = MyBatisUtil.getInstance();

		try {
		
			boardAnswerList = session.selectList("boardAnswer.getAllBoardAnswer");

		} catch (PersistenceException ex) {
			ex.printStackTrace();
		} finally {
			session.close();
		}
		return boardAnswerList;
	}

	@Override
	public int updateBoardAnswer(BoardAnswerVO basv) {
		
		int cnt = 0;
		
		SqlSession session = MyBatisUtil.getInstance();

		try {
			cnt = session.update("boardAnswer.updateBoardAnswer", basv);
			
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
	public int deleteBoardAnswer(String askNo) {
		
		int cnt = 0;
		
		SqlSession session = MyBatisUtil.getInstance();

		try {
			cnt = session.delete("boardAnswer.deleteBoardAnswer", askNo);
			
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
	public int updateBoardAnswerY(BoardAnswerVO basv) {
		int cnt = 0;
		
		SqlSession session = MyBatisUtil.getInstance();

		try {
			cnt = session.update("boardAnswer.updateBoardAnswerY", basv);
			
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
	public List<BoardAnswerVO> getBoardAnswer2(String askNo) {
		
		List<BoardAnswerVO> boardAnswerList = new ArrayList<BoardAnswerVO>();
		
		SqlSession session = MyBatisUtil.getInstance();

		try {
		
			boardAnswerList = session.selectList("boardAnswer.getBoardAnswer", askNo);

		} catch (PersistenceException ex) {
			ex.printStackTrace();
		} finally {
			session.close();
		}
		return boardAnswerList;
	}
	
	
	  @Override public BoardAnswerVO getBoardAnswer(String askNo) {
	  
	  BoardAnswerVO boardAnswer = new BoardAnswerVO();
	  
	  SqlSession session = MyBatisUtil.getInstance();
	  
	  try {
	  
	  boardAnswer = session.selectOne("boardAnswer.getBoardAnswer",askNo);
	  
	  } catch (PersistenceException ex) { ex.printStackTrace(); } finally {
	  session.close(); } return boardAnswer; }

	  
	@Override
	public int updateBoardAnswerN(BoardAnswerVO basv) {
		int cnt = 0;
		
		SqlSession session = MyBatisUtil.getInstance();

		try {
			cnt = session.update("boardAnswer.updateBoardAnswerN", basv);
			
			session.commit();

		} catch (PersistenceException ex) {
			session.rollback();
			ex.printStackTrace();
		} finally {
			session.close();
		}

		return cnt;
	}
	 
	

}
