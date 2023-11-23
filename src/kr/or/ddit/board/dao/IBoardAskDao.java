package kr.or.ddit.board.dao;

import java.util.List;

import kr.or.ddit.board.vo.BoardAskVO;

public interface IBoardAskDao {

	 public int insertBoardAsk(BoardAskVO bav);


	 public boolean checkBoardAsk(String askNo);

	
	 public List<BoardAskVO> getAllBoardAsk();


	 public int updateBoardAsk(BoardAskVO bav);

	
	 public int deleteBoardAsk(String askNo);
	 

	 public List<BoardAskVO> searchBoardAsk(BoardAskVO bav);

	 
	 public BoardAskVO getBoardAsk(String askNo);
}
