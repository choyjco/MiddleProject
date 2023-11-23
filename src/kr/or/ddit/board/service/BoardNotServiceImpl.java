package kr.or.ddit.board.service;

import java.util.List;

import kr.or.ddit.board.dao.BoardNotDaoImpl;
import kr.or.ddit.board.dao.IBoardNotDao;
import kr.or.ddit.board.vo.BoardNotVO;

public class BoardNotServiceImpl implements IBoardNotService{

	private IBoardNotDao boardNotDao;
	private static IBoardNotService boardNotService;
	
	public BoardNotServiceImpl() {
		boardNotDao = new BoardNotDaoImpl();
	}
	
	public static IBoardNotService getInstance() {
		
		if(boardNotService == null) {
			boardNotService = new BoardNotServiceImpl();
		}
		return boardNotService;
	}
	
	@Override
	public int registerBoardNot(BoardNotVO bnv) {
		
		return boardNotDao.insertBoardNot(bnv);
	}

	@Override
	public boolean checkBoardNot(String notNo) {
		
		return boardNotDao.checkBoardNot(notNo);
	}

	@Override
	public List<BoardNotVO> getAllBoardNot() {
		
		return boardNotDao.getAllBoardNot();
	}

	@Override
	public int modifyBoardNot(BoardNotVO bnv) {
		
		return boardNotDao.updateBoardNot(bnv);
	}

	@Override
	public int removeBoardNot(String notNo) {
		
		return boardNotDao.deleteBoardNot(notNo);
	}

	@Override
	public List<BoardNotVO> searchBoardNot(BoardNotVO bnv) {
		
		return boardNotDao.searchBoardNot(bnv);
	}

	@Override
	public BoardNotVO getBoardNot(String notNo) {
		
		return boardNotDao.getBoardNot(notNo); 
	}

	
}
