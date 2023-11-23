package kr.or.ddit.board.dao;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.board.vo.BoardFaqVO;
import kr.or.ddit.util.MyBatisUtil;

public class BoardFaqDaoImpl implements IBoardFaqDao {

	private static IBoardFaqDao boardFaqDao;
	
	public BoardFaqDaoImpl() {

	}
	
	public static IBoardFaqDao getInstance() {
		if(boardFaqDao == null) {
			boardFaqDao = new BoardFaqDaoImpl();
		}
		
		return boardFaqDao;
	}
	
	@Override
	public int insertBoardFaq(BoardFaqVO bfv) {
		
		int cnt = 0;

		SqlSession session = MyBatisUtil.getInstance();
		
		try {
			cnt = session.insert("boardFaq.insertBoardFaq", bfv);
			
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
	public boolean checkBoardFaq(String faqNo) {
		
		boolean isExist = false;
		
		SqlSession session = MyBatisUtil.getInstance(true);

		try {
			int cnt = session.selectOne("boardFaq.checkBoardFaq", faqNo);

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
	public List<BoardFaqVO> getAllBoardFaq() {
		
		List<BoardFaqVO> boardFaqList = new ArrayList<BoardFaqVO>();
		
		SqlSession session = MyBatisUtil.getInstance();

		try {
		
			boardFaqList = session.selectList("boardFaq.getAllBoardFaq");

		} catch (PersistenceException ex) {
			ex.printStackTrace();
		} finally {
			session.close();
		}
		return boardFaqList;
	}
	
	//상세 보기
	@Override
	public BoardFaqVO getBoardFaq(String faqNo) {
		
		BoardFaqVO boardFaq = new BoardFaqVO();
		
		SqlSession session = MyBatisUtil.getInstance();
		
		try {
			
			boardFaq = session.selectOne("boardFaq.getBoardFaq",faqNo);
			
		} catch (PersistenceException ex) {
			ex.printStackTrace();
		} finally {
			session.close();
		}
		return boardFaq;
	}

	@Override
	public int updateBoardFaq(BoardFaqVO bfv) {

		int cnt = 0;
		
		SqlSession session = MyBatisUtil.getInstance();

		try {
			cnt = session.update("boardFaq.updateBoardFaq", bfv);
			
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
	public int deleteBoardFaq(String faqNo) {
		
		int cnt = 0;
		
		SqlSession session = MyBatisUtil.getInstance();

		try {
			cnt = session.delete("boardFaq.deleteBoardFaq", faqNo);
			
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
	public List<BoardFaqVO> searchBoardFaq(BoardFaqVO bfv) {
		
		List<BoardFaqVO> boardFaqList = Collections.EMPTY_LIST;
		
		SqlSession session = null;

		try {
			session = MyBatisUtil.getInstance(true);
			
			Map<String, String> paraMap = new HashMap<String, String>();
			
			paraMap.put("faqNo", bfv.getFaqNo());
			paraMap.put("memId", bfv.getMemId());
			paraMap.put("faqTitle", bfv.getFaqTitle());
			paraMap.put("faqContent", bfv.getFaqContent());

			boardFaqList = session.selectList("boardFaq.searchBoardFaq", bfv);

		} catch (PersistenceException ex) {
			ex.printStackTrace();
		} finally {
			session.close();
		}
		return boardFaqList;
	}
	

	
	

}
