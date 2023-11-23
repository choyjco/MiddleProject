package kr.or.ddit.board.service;

import java.util.List;

import kr.or.ddit.board.dao.BoardFaqDaoImpl;
import kr.or.ddit.board.dao.IBoardFaqDao;
import kr.or.ddit.board.vo.BoardFaqVO;

public class BoardFaqServiceImpl implements IBoardFaqService{

	private IBoardFaqDao boardFaqDao;
	private static IBoardFaqService boardFaqService;
	
	public BoardFaqServiceImpl() {
		boardFaqDao = new BoardFaqDaoImpl();
	}
	
	public static IBoardFaqService getInstance() {
		
		if(boardFaqService == null) {
			boardFaqService = new BoardFaqServiceImpl();
		}
		return boardFaqService;
	}
	
	@Override
	public int registerBoardFaq(BoardFaqVO bfv) {
		
		return boardFaqDao.insertBoardFaq(bfv);
	}

	@Override
	public boolean checkBoardFaq(String faqNo) {
		
		return boardFaqDao.checkBoardFaq(faqNo);
	}

	@Override
	public List<BoardFaqVO> getAllBoardFaq() {
		
		return boardFaqDao.getAllBoardFaq();
	}

	@Override
	public int modifyBoardFaq(BoardFaqVO bfv) {
		
		return boardFaqDao.updateBoardFaq(bfv);
	}

	@Override
	public int removeBoardFaq(String faqNo) {
		
		return boardFaqDao.deleteBoardFaq(faqNo);
	}

	@Override
	public List<BoardFaqVO> searchBoardFaq(BoardFaqVO bfv) {
		
		return boardFaqDao.searchBoardFaq(bfv);
	}

	@Override
	public BoardFaqVO getBoardFaq(String faqNo) {
		
		return boardFaqDao.getBoardFaq(faqNo); 
	}

}
