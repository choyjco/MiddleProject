package kr.or.ddit.board.service;

import java.util.List;

import kr.or.ddit.board.dao.BoardAnswerDaoImpl;
import kr.or.ddit.board.dao.IBoardAnswerDao;
import kr.or.ddit.board.vo.BoardAnswerVO;

public class BoardAnswerServiceImpl implements IBoardAnswerService{

	private IBoardAnswerDao boardAnswerDao;
	private static IBoardAnswerService boardAnswerService;
	
	public BoardAnswerServiceImpl() {
		boardAnswerDao = new BoardAnswerDaoImpl();
	}
	
	public static IBoardAnswerService getInstance() {
		
		if(boardAnswerService == null) {
			boardAnswerService = new BoardAnswerServiceImpl();
		}
		return boardAnswerService;
	}

	@Override
	public int registerBoardAnswer(BoardAnswerVO basv) {
		return boardAnswerDao.insertBoardAnswer(basv);
	}

	@Override
	public List<BoardAnswerVO> getAllBoardAnswer() {
		return boardAnswerDao.getAllBoardAnswer();
	}

	@Override
	public int modifyBoardAnswer(BoardAnswerVO basv) {
		return boardAnswerDao.updateBoardAnswer(basv);
	}

	@Override
	public int removeBoardAnswer(String askNo) {
		return boardAnswerDao.deleteBoardAnswer(askNo);
	}

	@Override
	public List<BoardAnswerVO> getBoardAnswer2(String askNo) {
		return boardAnswerDao.getBoardAnswer2(askNo);
	}

	@Override
	public BoardAnswerVO getBoardAnswer(String askNo) {
		return boardAnswerDao.getBoardAnswer(askNo);
	}

	@Override
	public int modifyBoardAnswerY(BoardAnswerVO basv) {
		return boardAnswerDao.updateBoardAnswerY(basv);
	}

	@Override
	public int modifyBoardAnswerN(BoardAnswerVO basv) {
		return boardAnswerDao.updateBoardAnswerN(basv);
	}
	

}
