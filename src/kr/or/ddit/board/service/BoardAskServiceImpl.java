package kr.or.ddit.board.service;

import java.util.List;

import kr.or.ddit.board.dao.BoardAskDaoImpl;
import kr.or.ddit.board.dao.IBoardAskDao;
import kr.or.ddit.board.vo.BoardAskVO;

public class BoardAskServiceImpl implements IBoardAskService{

	private IBoardAskDao boardAskDao;
	private static IBoardAskService boardAskService;
	
	public BoardAskServiceImpl() {
		boardAskDao = new BoardAskDaoImpl();
	}
	
	public static IBoardAskService getInstance() {
		
		if(boardAskService == null) {
			boardAskService = new BoardAskServiceImpl();
		}
		return boardAskService;
	}
	
	@Override
	public int registerBoardAsk(BoardAskVO bav) {
		
		return boardAskDao.insertBoardAsk(bav);
	}

	@Override
	public boolean checkBoardAsk(String askNo) {
		
		return boardAskDao.checkBoardAsk(askNo);
	}

	@Override
	public List<BoardAskVO> getAllBoardAsk() {
		
		return boardAskDao.getAllBoardAsk();
	}

	@Override
	public int modifyBoardAsk(BoardAskVO bav) {
		
		return boardAskDao.updateBoardAsk(bav);
	}

	@Override
	public int removeBoardAsk(String askNo) {
		
		return boardAskDao.deleteBoardAsk(askNo);
	}

	@Override
	public List<BoardAskVO> searchBoardAsk(BoardAskVO bav) {
		
		return boardAskDao.searchBoardAsk(bav);
	}

	@Override
	public BoardAskVO getBoardAsk(String askNo) {
		
		return boardAskDao.getBoardAsk(askNo); 
	}

}
