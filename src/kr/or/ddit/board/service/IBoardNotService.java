package kr.or.ddit.board.service;

import java.util.List;

import kr.or.ddit.board.vo.BoardNotVO;

public interface IBoardNotService {

	public int registerBoardNot(BoardNotVO bnv);
	
	public boolean checkBoardNot(String notNo);
	
	public List<BoardNotVO> getAllBoardNot();
	
	public int modifyBoardNot(BoardNotVO bnv);
	
	public int removeBoardNot(String notNo);

	public List<BoardNotVO> searchBoardNot(BoardNotVO bnv);

	public BoardNotVO getBoardNot(String notNo);
}
