package kr.or.ddit.board.service;

import java.util.List;

import kr.or.ddit.board.vo.BoardAskVO;

	public interface IBoardAskService {

	public int registerBoardAsk(BoardAskVO bav);
	
	public boolean checkBoardAsk(String askNo);
	
	public List<BoardAskVO> getAllBoardAsk();
	
	public int modifyBoardAsk(BoardAskVO bav);
	
	public int removeBoardAsk(String askNo);

	public List<BoardAskVO> searchBoardAsk(BoardAskVO bav);

	public BoardAskVO getBoardAsk(String askNo);
	
}
